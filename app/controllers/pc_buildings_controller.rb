class PcBuildingsController < ApplicationController
  before_action :set_pc_building, only: %i[ show edit update destroy ]

  # GET /pc_buildings or /pc_buildings.json
  def index
    @pc_buildings = PcBuilding.all
  end

  # GET /pc_buildings/1 or /pc_buildings/1.json
  def show
  end

  # GET /pc_buildings/new
  def new
    @pc_building = PcBuilding.new
  end

  # GET /pc_buildings/1/edit
  def edit
  end

  # POST /pc_buildings or /pc_buildings.json
  def create
    @pc_building = PcBuilding.new(pc_building_params)

    respond_to do |format|
      if @pc_building.save
        format.html { redirect_to pc_building_url(@pc_building), notice: "Pc building was successfully created." }
        format.json { render :show, status: :created, location: @pc_building }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pc_building.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pc_buildings/1 or /pc_buildings/1.json
  def update
    respond_to do |format|
      if @pc_building.update(pc_building_params)
        format.html { redirect_to pc_building_url(@pc_building), notice: "Pc building was successfully updated." }
        format.json { render :show, status: :ok, location: @pc_building }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pc_building.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pc_buildings/1 or /pc_buildings/1.json
  def destroy
    @pc_building.destroy!

    respond_to do |format|
      format.html { redirect_to pc_buildings_url, notice: "Pc building was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pc_building
      @pc_building = PcBuilding.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pc_building_params
      params.fetch(:pc_building, {}).permit(:clientName, :component_id_1, :component_id_2, :component_id_3, :component_id_4)
    end
end
