class TottlesController < ApplicationController
  before_action :set_tottle, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /tottles
  # GET /tottles.json
  def index
    @tottles = Tottle.all
  end

  # GET /tottles/1
  # GET /tottles/1.json
  def show
  end

  # GET /tottles/new
  def new
    @tottle = Tottle.new
  end

  # GET /tottles/1/edit
  def edit
  end

  # POST /tottles
  # POST /tottles.json
  def create
    @tottle = Tottle.new(tottle_params)

    respond_to do |format|
      if @tottle.save
        format.html { redirect_to @tottle, notice: 'Tottle was successfully created.' }
        format.json { render :show, status: :created, location: @tottle }
      else
        format.html { render :new }
        format.json { render json: @tottle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tottles/1
  # PATCH/PUT /tottles/1.json
  def update
    respond_to do |format|
      if @tottle.update(tottle_params)
        format.html { redirect_to @tottle, notice: 'Tottle was successfully updated.' }
        format.json { render :show, status: :ok, location: @tottle }
      else
        format.html { render :edit }
        format.json { render json: @tottle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tottles/1
  # DELETE /tottles/1.json
  def destroy
    @tottle.destroy
    respond_to do |format|
      format.html { redirect_to tottles_url, notice: 'Tottle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tottle
      @tottle = Tottle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tottle_params
      params.require(:tottle).permit(:message, :user_id)
    end
end
