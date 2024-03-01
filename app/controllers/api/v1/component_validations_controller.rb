class Api::V1::ComponentValidationsController < ApplicationController
  skip_before_action :verify_authenticity_token, if: :json_request?
  before_action :set_component_validation, only: %i[show update destroy]

  # GET /api/v1/component_validations
  def index
    @component_validations = ComponentValidation.all
    render json: @component_validations
  end

  # GET /api/v1/component_validations/1
  def show
    render json: @component_validation
  end

  # POST /api/v1/component_validations
  def create
    @component_validation = ComponentValidation.new(component_validation_params)

    if @component_validation.save
      render json: @component_validation, status: :created, location: api_v1_component_validation_url(@component_validation)
    else
      render json: @component_validation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/component_validations/1
  def update
    if @component_validation.update(component_validation_params)
      render json: @component_validation
    else
      render json: @component_validation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/component_validations/1
  def destroy
    @component_validation.destroy
    head :no_content
  end

  private

  def json_request?
    request.format.json?
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_component_validation
    @component_validation = ComponentValidation.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def component_validation_params
    params.require(:component_validation).permit(:componentType, :component_validation, :component_attribute_id)
  end
end
