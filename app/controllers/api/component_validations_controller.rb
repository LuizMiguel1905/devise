module Api
class ComponentValidationsController < ApplicationController
  skip_before_action :verify_authenticity_token, if: :json_request?
  before_action :set_component_validation, only: %i[ show edit update destroy ]

  # GET /component_validations or /component_validations.json
  def index
    @component_validations = ComponentValidation.all
    render json: @component_validations
  end

  # GET /component_validations/1 or /component_validations/1.json
  def show
  end

  # GET /component_validations/new
  def new
    @component_validation = ComponentValidation.new
  end

  # GET /component_validations/1/edit
  def edit
  end

  # POST /component_validations or /component_validations.json
  def create
    @component_validation = ComponentValidation.new(component_validation_params)

    respond_to do |format|
      if @component_validation.save
        format.html { redirect_to component_validation_url(@component_validation), notice: "Component validation was successfully created." }
        format.json { render :show, status: :created, location: @component_validation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @component_validation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /component_validations/1 or /component_validations/1.json
  def update
    respond_to do |format|
      if @component_validation.update(component_validation_params)
        format.html { redirect_to component_validation_url(@component_validation), notice: "Component validation was successfully updated." }
        format.json { render :show, status: :ok, location: @component_validation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @component_validation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /component_validations/1 or /component_validations/1.json
  def destroy
    @component_validation.destroy!

    respond_to do |format|
      format.html { redirect_to component_validations_url, notice: "Component validation was successfully destroyed." }
      format.json { head :no_content }
    end
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
      params.require(:component_validation).permit(:componentType, :component_validation,:component_attribute_id )
    end
end
end
