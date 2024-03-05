class Api::V1::ComputersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :destroy, :update]
  protect_from_forgery with: :null_session, only: [:create, :update, :destroy]
  before_action :set_computer, only: %i[show update destroy]

  # GET /api/v1/computers
  def index
    @computers = Computer.all
    render json: @computers
  end

  # GET /api/v1/computers/1
  def show
    render json: @computer
  end

  # POST /api/v1/computers
  def create
    @computer = Computer.new(computer_params)

    if @computer.save && valid_component_types? && cpu_validate? && ram_validate?
      render json: @computer, status: :created, location: api_v1_computer_url(@computer)
    else
      error_messages = []

      unless valid_component_types?
        error_messages << "Algum componente faltando!"
        error_messages << "Está faltando processador (CPU)" unless computer_needs_cpu?
        error_messages << "Está faltando memória RAM" unless computer_needs_ram?
        error_messages << "Está faltando placa mãe" unless computer_needs_motherboard?
        error_messages << "É necessário colocar placa de video" unless computer_needs_mb_gpu? || computer_needs_gpu?
      end

      unless cpu_validate?
        error_messages << "Falha na validação da CPU:"
        error_messages << "As marcas do processador e da placa mãe não se correspondem. Escolha a mesma marca para ambas!" unless different_brands?
      end

      unless ram_validate?
        error_messages << "Falha na validação da RAM:"
        error_messages << " - Número de slots de memória excedido." unless enough_memory_slots?
        error_messages << " - Memória total excede o limite permitido." unless valid_ram_total?
      end
      render json: { error: error_messages.join(" ") }, status: :unprocessable_entity

    end
  end


  # PATCH/PUT /api/v1/computers/1
  def update
    if @computer.update(computer_params)
      render json: @computer
    else
      render json: @computer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/computers/1
  def destroy
    @computer.destroy
    head :no_content
  end

  private


  private

  #Validador da memória RAM
  def ram_validate?
    component_names = params.dig(:computer, :component_names) || []

    @mb_memory_slots = Component.joins(:component_attribute)
                               .where(componentName: component_names)
                               .where.not(component_attributes: { memorySlot: nil })
                               .select('DISTINCT component_attributes.memorySlot')
                               .pluck(:memorySlot)
                               .first

    @mb_memory_limit = Component.joins(:component_attribute)
                               .where(componentName: component_names)
                               .where.not(component_attributes: { memoryLimit: nil })
                               .select('DISTINCT component_attributes.memoryLimit')
                               .pluck(:memoryLimit)
                               .first

    @ram_memory = Component.joins(:component_attribute)
                          .where(componentName: component_names)
                          .where.not(component_attributes: { memory: nil })
                          .select('DISTINCT component_attributes.memory')
                          .pluck(:memory)
                          .first

    enough_memory_slots = @mb_memory_slots.to_i >= @computer.qntOfSlot

    enough_memory_slots ? true : false

    @ram_total = @computer.qntOfSlot * @ram_memory.to_i

    return enough_memory_slots && (@mb_memory_limit.to_i >= @ram_total)
  end

  #Validador da CPU
  def cpu_validate?
    component_names = params.dig(:computer, :component_names) || []

    @cpu_brands = Component.joins(:component_attribute)
                         .where(componentName: component_names)
                         .where.not(component_attributes: { brand: nil })
                         .select('DISTINCT component_attributes.brand')
                         .map(&:brand)

    @mb_cpuSupport = Component.joins(:component_attribute)
                             .where(componentName: component_names)
                             .where.not(component_attributes: { cpuSupport: nil })
                             .select('DISTINCT component_attributes.cpuSupport')
                             .map(&:cpuSupport)


    return @mb_cpuSupport.include?("BOTH") ? true : @cpu_brands.sort == @mb_cpuSupport.sort

  end


  #Validador dos componentes
  def valid_component_types?
    component_names = params.dig(:computer, :component_names) || []

    @required_types = ['RAM', 'CPU', 'Motherboard']
    @required_types_with_gpu = ['RAM', 'CPU', 'Motherboard', 'GPU']


    @unique_types = Component.joins(:component_attribute)
                            .where(componentName: component_names)
                            .select('DISTINCT component_attributes.componentType')
                            .map(&:componentType)

    @has_video = Component.joins(:component_attribute)
                          .where(componentName: component_names)
                          .where.not(component_attributes: {video: nil})
                          .select('DISTINCT component_attributes.video')
                          .pluck(:video)
                          .first
    #return @unique_types.sort == @@required_types_with_gpu.sort
    if @has_video
      return @unique_types.sort == @required_types_with_gpu.sort || @unique_types.sort == @required_types.sort
    else
      return @unique_types.sort == @required_types_with_gpu.sort
    end
  end
  def computer_needs_motherboard?
    @required_types.include?('Motherboard') && @unique_types.include?('Motherboard')
  end
  def computer_needs_ram?
    @required_types.include?('RAM') && @unique_types.include?('RAM')
  end
  def computer_needs_cpu?
    @required_types.include?('CPU') && @unique_types.include?('CPU')
  end
  def computer_needs_gpu?
    @required_types_with_gpu.include?('GPU') && @unique_types.include?('GPU')
  end
  def computer_needs_mb_gpu?
    @has_video ?  @unique_types.sort == @required_types.sort : @unique_types.sort == @required_types_with_gpu.sort
  end
  #Tratamento de erros
  #Memória RAM
  def enough_memory_slots?
    @mb_memory_slots.to_i >= @computer.qntOfSlot
  end

  def valid_ram_total?
    ram_total = @computer.qntOfSlot * @ram_memory.to_i
    @mb_memory_limit.to_i >= ram_total
  end

  #Processador - Placa Mãe
  def different_brands?
    @cpu_brands.sort == @mb_cpuSupport.sort
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_computer
    @computer = Computer.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def computer_params
    component_names = params.dig(:computer, :component_names) || []
    component_ids = Component.where(componentName: component_names).pluck(:id)

    params.require(:computer).permit(:clientName, :qntOfSlot).merge(component_ids: component_ids)
  end
end
