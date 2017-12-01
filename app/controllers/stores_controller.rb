class StoresController < ApplicationController
  before_action :set_store, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @stores = Store.all
  end

  def new
    @user = current_user
    @store = Store.new
    
  end
  
  def makestore
    @user = current_user
   
    @store = Store.create(name: params[:name], description: params[:description], products: params[:products], location: params[:location], user_id: params[:user_id], email: params[:email], phone_number: params[:phone_number], store_id: params[:store_id])
    
    @store.save
    redirect_to user_store_path(@user.id, @store.id)
    
  end


  def create
    @user = current_user
    @store = Store.create(name: params[:name], description: params[:description], products: params[:products], location: params[:location], user_id: params[:user_id], email: params[:email], phone_number: params[:phone_number], store_id: params[:store_id])
   
    redirect_to user_store_path(@user.id, @store.id)
  end

  def edit
  end
  
  def show
    
    @store = Store.find(params[:id])
    @products = Product.all
    @user = current_user
    @comments = Comment.all
    @product = Product.new
    
  end

  def update
  end

  def destroy
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store
      @store = Store.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def store_params
      params.require(:store).permit(:products, :name, :description, :user_id, :store_id, :location, :email, :phone_number)
    end
    
      def comment_params
      params.require(:comment).permit(:text, :user_id, :rume_id, :convo_id, :comment_id, :likes, :dislikes, :store_id)
    end
end
