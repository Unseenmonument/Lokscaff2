class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  
  def index
    @products = Product.all
  end
  
  def new
    @user = current_user
    @product = Product.new
    @store = Store.find(params[:store_id])
  end
  
  def show
    
    @user = current_user
    @product = Product.find(params[:id])
    @store = Store.find(params[:store_id])
    
    @comments = Comment.all
    @comment = Comment.new
    
  end

  def newprod
    
    @user = current_user
    @store = Store.find(params[:store_id])
    @product = Product.create(name: params[:name], description: params[:description], quantity: params[:quantity], price: params[:price], user_id: params[:user_id], store_id: params[:store_id], image: params[:image])

    respond_to do |format|
      if @product.save
        format.html { redirect_to user_store_product_path(@user.id, @store.id, @product.id), notice: 'Product was successfully created.' }
      else
        format.html { render :new }
      end
    end
   
  end

  def create
    @user = current_user
    @store = Store.find(params[:store_id])
    @product = Product.create(name: params[:name], description: params[:description], quantity: params[:quantity], price: params[:price], user_id: params[:user_id], store_id: params[:store_id], image: params[:image])

    respond_to do |format|
      if @product.save
        format.html { redirect_to user_store_product_path(@user.id, @store.id, @product.id), notice: 'Product was successfully created.' }
      else
        format.html { render :new }
      end
    end
   
  end
   

  def edit
  end

  def destroy
  end
  
  def update
  end

  private
  
    def set_product
      @product = Product.find(params[:id])
    end
  
    def product_params
      params.require(:product).permit(:name, :quantity, :description, :price, :image, :user_id, :store_id)
    end

end
