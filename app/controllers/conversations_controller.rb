class ConversationsController < ApplicationController
  before_action :set_room, only: [:show, :new, :latest, :popular, :edit, :update, :destroy]
  before_action :set_convo, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index

    @convo = Conversation.all

    
  end

  def user
  end

  def room
  end

  def latest
  end

  def popular
  end

  def show
    @convo = Conversation.find(params[:id])
  end

  def new

    @rume = Rume.find(params[:rume_id])
    @convo = Conversation.new

      if @convo.save
        redirect_to rume_path(@rume), notice: "conversation sucesfully created!"
      else 
        render :new
      end
  end

  def edit
    
    @convo = Conversation.find(params[:rume_id])


  end

  def create
    @rume = Rume.find(params[:rume_id])
    @convo = Conversation.new(convo_params)

      if @convo.save
        redirect_to rume_path(@rume), notice: "conversation sucesfully created!"
      else 
        render :new
      end
  end

  def update
    respond_to do |format|
      if @convo.update(convo_params)
        format.html { redirect_to @convo, notice: 'Your conversation was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  private

    def set_room
      
    end

    def set_convo
        @convo = Conversation.find(params[:id])
    end

    def convo_params
        params.require(:conversation).permit(:title, :description, :user_id, :convo_id)
    end


end
