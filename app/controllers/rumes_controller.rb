class RumesController < ApplicationController
  before_action :set_rume, only: [:show, :edit, :update, :destroy, :listen, :ignore]
  before_action :authenticate_user!

  # GET /rumes
  # GET /rumes.json
  def index
    @rumes = Rume.all
  end

  # GET /rumes/1
  # GET /rumes/1.json
  def show

    @user = current_user

    @convos = Convo.all
    @convo = Convo.new
    


  end

  # GET /rumes/new
  def new
    @user = current_user
    @rume = Rume.new
  end

  def listen
    
    if !current_user.listen_to.include?(@rume.id)
      current_user.listen_to.push(@rume.id)
    end
    current_user.save
    
    if !@rume.listeners.include?(current_user)
      @rume.listeners.push(current_user.id)
    end
    @rume.save

    redirect_to rume_path(@rume)
  end

  def ignore
    
    if current_user.listen_to.include?(@rume.id)
      current_user.listen_to.delete(@rume.id)
    end
    current_user.save
    
    if @rume.listeners.include?(current_user.id)
      @rume.listeners.delete(current_user.id)
    end
    @rume.save

    redirect_to rume_path(@rume)
  end

  # GET /rumes/1/edit
  def edit
  end

  # POST /rumes
  # POST /rumes.json
  def create
    @rume = Rume.new(rume_param)
    
    if !current_user.listen_to.include?(@rume)
      current_user.listen_to.push(@rume.id)
    end
    current_user.save
    
    if !@rume.listeners.include?(current_user)
      @rume.listeners.push(current_user.id)
    end
  
    respond_to do |format|
      if @rume.save
        format.html { redirect_to @rume, notice: 'Rume was successfully created.' }
        format.json { render :show, status: :created, location: @rume }
      else
        format.html { render :new }
        format.json { render json: @rume.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rumes/1
  # PATCH/PUT /rumes/1.json
  def update
    respond_to do |format|
      if @rume.update(rume_params)
        format.html { redirect_to @rume, notice: 'Rume was successfully updated.' }
        format.json { render :show, status: :ok, location: @rume }
      else
        format.html { render :edit }
        format.json { render json: @rume.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rumes/1
  # DELETE /rumes/1.json
  def destroy
    @rume.destroy
    respond_to do |format|
      format.html { redirect_back fallback_location: root_path, notice: 'Rume was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rume
      @rume = Rume.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rume_param
      params.require(:rume).permit(:creator, :name, :description, :user_id, :room_id)
    end

    def rume_params
      params.require(:rume).permit(:creator, :name, :description, :guidelines, :user_id, :room_id)
    end
end
