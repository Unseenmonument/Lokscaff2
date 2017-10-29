class ConvosController < ApplicationController
  before_action :set_convo, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /convos
  # GET /convos.json
  def index
    @rume = Rume.find(params[:rume_id])
    @convos = Convo.all
  end

  # GET /convos/1
  # GET /convos/1.json
  def show
    @rume = Rume.find(params[:rume_id])
    @convo = Convo.find(params[:id])
    @comments = Comment.all

    @comment = Comment.new
  end

  # GET /convos/new
  def new
    @rume = Rume.find(params[:rume_id])
    @convo = Convo.new
  end

  # GET /convos/1/edit
  def edit
    @rume = Rume.find(params[:rume_id])
    @convo = Convo.find(params[:id])
  end

  # POST /convos
  # POST /convos.json
  def create
    @convo = Convo.new(convo_params)

    respond_to do |format|
      if @convo.save
        format.html { redirect_to @convo, notice: 'Convo was successfully created.' }
        format.json { render :show, status: :created, location: @convo }
      else
        format.html { render :new }
        format.json { render json: @convo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /convos/1
  # PATCH/PUT /convos/1.json
  def update
    respond_to do |format|
      if @convo.update(convo_params)
        format.html { redirect_to @convo, notice: 'Convo was successfully updated.' }
        format.json { render :show, status: :ok, location: @convo }
      else
        format.html { render :edit }
        format.json { render json: @convo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /convos/1
  # DELETE /convos/1.json
  def destroy
    @convo.destroy
    respond_to do |format|
      format.html { redirect_to convos_url, notice: 'Convo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_convo
      @convo = Convo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def convo_params
      params.require(:convo).permit(:user_id, :rume_id, :title, :description, :convo_id)
    end
end
