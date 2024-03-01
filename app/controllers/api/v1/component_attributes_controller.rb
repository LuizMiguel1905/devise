class Api::V1::ComponentAttributesController < ApplicationController
  skip_before_action :verify_authenticity_token, if: :json_request?
  before_action :set_component_attribute, only: %i[show update destroy]

  # GET /api/v1/component_attributes
  def index
    @component_attributes = ComponentAttribute.all
    render json: @component_attributes
  end

  # GET /api/v1/component_attributes/1
  def show
    render json: @component_attribute
  end

  # POST /api/v1/component_attributes
  def create
    @component_attribute = ComponentAttribute.new(component_attribute_params)

    if @component_attribute.save
      render json: @component_attribute, status: :created, location: api_v1_component_attribute_url(@component_attribute)
    else
      render json: @component_attribute.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/component_attributes/1
  def update
    if @component_attribute.update(component_attribute_params)
      render json: @component_attribute
    else
      render json: @component_attribute.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/component_attributes/1
  def destroy
    @component_attribute.destroy
    head :no_content
  end

  private

  def json_request?
    request.format.json?
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_component_attribute
    @component_attribute = ComponentAttribute.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def component_attribute_params
    params.require(:component_attribute).permit(:brand, :cpuSupport, :memorySlot, :memoryLimit, :video, :memory, :componentType, :isGPU)
  end
end
