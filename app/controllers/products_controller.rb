class ProductsController < ApplicationController
  
  
  def index
  end

  def new
    @user = current_user
    @product = Product.new
    @store = Store.find(params[:store_id])
  end

  def create
    @user = current_user
    @store = Store.find(params[:id])
    @product = Product.create(name: params[:name], description: params[:description], products: params[:quantity], location: params[:price], user_id: params[:user_id], store_id: params[:store_id])
    
    redirect_to user_store_product_path(@user.id, @store.id, @product.id)
    
  end

  def edit
  end

  def update
  end

  def show
    @product = Product.find(params[:id])
    @store = Store.find(params[:id])
  end

  def destroy
  end

  private
  
    def product_params
      params.require(:product).permit(:name, :quantity, :description, :price, :reviews)
    end

end
