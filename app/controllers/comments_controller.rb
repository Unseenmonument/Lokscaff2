class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /comments
  # GET /comments.json
  def index
    @rume = Rume.find(params[:rume_id])
    @convo = Convo.find(params[:convo_id])
    @comments = Comment.all
  end

  def vote
    value = params[:type] == "up" ? 1 : -1
    @rume = Rume.find(params[:rume_id])
    @convo = Convo.find(params[:convo_id])
    redirect_to :back, notice: "Your Vote Has Been Added"
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @rume = Rume.find(params[:rume_id])
    @convo = Convo.find(params[:convo_id])
  end

  # GET /comments/new
  def new
    @rume = Rume.find(params[:rume_id])
    @convo = Convo.find(params[:convo_id])
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
    if @rume = Rume.find(params[:rume_id]) == nil
    then @user = User.find
    @convo = Convo.find(params[:convo_id])
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)


    respond_to do |format|
      if @comment.save
        format.html { redirect_to rume_convo_path(rume_id: @comment.rume_id, id: @comment.convo_id), notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:text, :user_id, :rume_id, :convo_id, :comment_id, :likes, :dislikes)
    end
end
