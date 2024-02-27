class BuildersController < ApplicationController
  before_action :set_builder, only: %i[ show edit update destroy ]

  # GET /builders or /builders.json
  def index
    @builders = Builder.all
  end

  # GET /builders/1 or /builders/1.json
  def show
  end

  # GET /builders/new
  def new
    @builder = Builder.new
  end

  # GET /builders/1/edit
  def edit
  end

  # POST /builders or /builders.json
  def create
    @builder = Builder.new(builder_params)

    respond_to do |format|
      if @builder.save
        format.html { redirect_to builder_url(@builder), notice: "Builder was successfully created." }
        format.json { render :show, status: :created, location: @builder }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @builder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /builders/1 or /builders/1.json
  def update
    respond_to do |format|
      if @builder.update(builder_params)
        format.html { redirect_to builder_url(@builder), notice: "Builder was successfully updated." }
        format.json { render :show, status: :ok, location: @builder }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @builder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /builders/1 or /builders/1.json
  def destroy
    @builder.destroy!

    respond_to do |format|
      format.html { redirect_to builders_url, notice: "Builder was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_builder
      @builder = Builder.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def builder_params
      params.require(:builder).permit(:clientName)
    end
end
