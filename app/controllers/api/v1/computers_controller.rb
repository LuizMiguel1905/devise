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

    if @computer.save && valid_component_types?
      render json: @computer, status: :created, location: api_v1_computer_url(@computer)
    elsif cpu_validate?
      render json: { error: "Falha na validação da CPU" }, status: :unprocessable_entity
    else
      render json: { error: "Falha na validação dos componentes" }, status: :unprocessable_entity
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


  def cpu_validate?
    cpu_validate = Component.joins(:component_attribute)
                            .where('component_attributes.componentType = ?', 'CPU')
                            .pluck(:brand)
    mb_validate = Component.joins(:component_attribute)
                           .where('component_attributes.componentType = ?', 'Motherboard')
                           .pluck(:cpuSupport)

puts "cpu_validate: #{cpu_validate}"
puts "mb_validate: #{mb_validate}"

    return cpu_validate.sort == mb_validate.sort
  end
  def valid_component_types?
    component_names = params.dig(:computer, :component_names) || []

    required_types = ['RAM', 'CPU', 'Motherboard', 'GPU']


    unique_types = Component.joins(:component_attribute)
                            .where(componentName: component_names)
                            .select('DISTINCT component_attributes.componentType')
                            .map(&:componentType)

    return unique_types.sort == required_types.sort
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
