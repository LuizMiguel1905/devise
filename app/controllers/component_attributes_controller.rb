class ComponentAttributesController < ApplicationController
  before_action :set_component_attribute, only: %i[ show edit update destroy ]

  # GET /component_attributes or /component_attributes.json
  def index
    @component_attributes = ComponentAttribute.all
  end

  # GET /component_attributes/1 or /component_attributes/1.json
  def show
  end

  # GET /component_attributes/new
  def new
    @component_attribute = ComponentAttribute.new
  end

  # GET /component_attributes/1/edit
  def edit
  end

  # POST /component_attributes or /component_attributes.json
  def create
    @component_attribute = ComponentAttribute.new(component_attribute_params)

    respond_to do |format|
      if @component_attribute.save
        format.html { redirect_to component_attribute_url(@component_attribute), notice: "Component attribute was successfully created." }
        format.json { render :show, status: :created, location: @component_attribute }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @component_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /component_attributes/1 or /component_attributes/1.json
  def update
    respond_to do |format|
      if @component_attribute.update(component_attribute_params)
        format.html { redirect_to component_attribute_url(@component_attribute), notice: "Component attribute was successfully updated." }
        format.json { render :show, status: :ok, location: @component_attribute }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @component_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /component_attributes/1 or /component_attributes/1.json
  def destroy
    @component_attribute.destroy!

    respond_to do |format|
      format.html { redirect_to component_attributes_url, notice: "Component attribute was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_component_attribute
      @component_attribute = ComponentAttribute.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def component_attribute_params
      params.require(:component_attribute).permit(:brand, :cpuSupport, :memorySlot, :memoryLimit, :video  , :memory, :componentType, :isGPU)
    end
end
