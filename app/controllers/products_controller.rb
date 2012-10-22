class ProductsController < ApplicationController
  # GET /products
  # GET /products.json
  
  def index
    if params[:fetch] == "true"
      @products = Product.where(:name => params[:id])
    elsif params[:store_id]
      @store = Store.find(params[:store_id])
      @products = Product.all
    else
      @products = Product.all
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @store = Store.find(params[:store_id])
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
   if params[:store_id]
      @store = Store.find(params[:store_id])
      @product = @store.products.build
    else
      @product = Product.new
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/1/edit
  def edit
    @store = Store.find(params[:store_id])
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.json
  def create
    if params[:store_id]
      @store = Store.find(params[:store_id])
      @product = @store.products.create!(params[:product])
      @product.update_inventory(@store.id)
    else
      @product = Product.create!(params[:product])
      Inventory.update_stock(params[:product_id],params[:store_id],params[:qty])
    end
    respond_to do |format|
      if @product.save
        format.html { redirect_to [@store,@product], notice: 'Product was successfully created.' }
        format.json { render json: [@store,@product], status: :created, location: @product }
      else
        format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    @store = Store.find(params[:store_id])
    @product = Product.find(params[:id])
    
    respond_to do |format|
      if @product.update_attributes(params[:product])
        if @product.update_inventory(@store.id)
          format.html { redirect_to [@store,@product] , notice: 'Product was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @product.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @store = Store.find(params[:store_id])
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end
end
