class EpicksController < ApplicationController
  before_action :set_epick, only: %i[ show edit update destroy update_status]

  # GET /epicks or /epicks.json
  def index
    Epick.all.where("updated_at < ?", DateTime.now).update_all(status: false)
    @epicks = Epick.all.order(:created_at)
  end

  # GET /epicks/1 or /epicks/1.json
  def show
  end

  # GET /epicks/new
  def new
    @epick = Epick.new
  end

  # GET /epicks/1/edit
  def edit
  end

  # POST /epicks or /epicks.json
  def create
    @epick = Epick.new(epick_params)

    respond_to do |format|
      if @epick.save
        format.html { redirect_to @epick, notice: "Epick was successfully created." }
        format.json { render :show, status: :created, location: @epick }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @epick.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /epicks/1 or /epicks/1.json
  def update
    respond_to do |format|
      if @epick.update(epick_params)
        format.html { redirect_to @epick, notice: "Epick was successfully updated." }
        format.json { render :show, status: :ok, location: @epick }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @epick.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /epicks/1 or /epicks/1.json
  def destroy
    @epick.destroy
    respond_to do |format|
      format.html { redirect_to epicks_url, notice: "Epick was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def update_status
    Epick.all.where("updated_at < ?", Date.today).update_all(status: false)
    @epick.update(status: !@epick.status)
    @epicks = Epick.all.order(:created_at)
    
    render :index
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_epick
      @epick = Epick.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def epick_params
      params.require(:epick).permit(:name, :status)
    end
end
