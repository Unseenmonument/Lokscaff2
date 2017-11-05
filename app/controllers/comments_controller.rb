class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
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
  
    def upvote
      
    if !current_user.upvote_com.include?(@comment.id)
      current_user.upvote_com.push(@comment.id)
      current_user.downvote_com.delete(@comment.id)
    end
    current_user.save
    
    if !@comment.upvote_com.include?(current_user)
      @comment.upvote_com.push(current_user.id)
      @comment.downvote_com.delete(current_user.id)
    end
    @comment.save

    redirect_back(fallback_location: root_path)
  end

  def downvote
    
    if !current_user.downvote_com.include?(@comment.id)
      current_user.downvote_com.push(@comment.id)
      current_user.upvote_com.delete(@comment.id)
    end
    current_user.save
    
    if !@comment.downvote_com.include?(current_user.id)
      @comment.downvote_com.push(current_user.id)
      @comment.upvote_com.delete(current_user.id)
    end
    @comment.save

    redirect_back(fallback_location: root_path)
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @rume = Rume.find(params[:rume_id])
    @convo = Convo.find(params[:convo_id])
    @comment = Comment.find(params[:id])
    
    @downvotescom = @comment.downvote_com.count * -1
    @upvotescom = @comment.upvote_com.count
    
    @votescom = @upvotescom + @downvotescom
    
    
  end

  # GET /comments/new
  def new
    @rume = Rume.find(params[:rume_id])
    @convo = Convo.find(params[:convo_id])
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
    @rume = Rume.find(params[:rume_id])
    @convo = Convo.find(params[:convo_id])
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)
    
    if !current_user.upvote_com.include?(@comment.id)
      current_user.upvote_com.push(@comment.id)
    end
    current_user.save
    
    if !@comment.upvote_com.include?(current_user)
      @comment.upvote_com.push(current_user.id)
    end
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
        format.html { redirect_to rume_convo_path(@comment.rume_id, @comment.convo_id), notice: 'Comment was successfully updated.' }
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
      format.html { redirect_back fallback_location: root_path, notice: 'Comment was successfully destroyed.' }
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
