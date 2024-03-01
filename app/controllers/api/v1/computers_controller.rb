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
    if unique_component_types?
      if @computer.save
        render json: @computer, status: :created, location: api_v1_computer_url(@computer)
      else
        render json: @computer.errors, status: :unprocessable_entity
      end
    else
      render json: { error: "Componentes repetidos" }, status: :unprocessable_entity
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

  def unique_component_types?
    component_types = @computer.components.map { |component| component.component_validation.componentType }
    component_types.uniq.length == component_types.length
  end
  def valid_component_ids?
    components = Component.where(id: @computer.component_ids)
    validations = ComponentValidation.where(component_attribute_id: components.pluck(:id))

    validations.none? { |validation| validation.componentType == 'RAM' }
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
