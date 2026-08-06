require "csv"

class ProductsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product
    else
      render :new, status: :unprocessable_entity
    end
  end

  def export
    @products = Product.all

    respond_to do |format|
      format.csv do
        response.headers["Content-Type"] = "text/csv"
        response.headers["Content-Disposition"] = "attachment; filename=products.csv"
        render template: "products/export"
      end
    end
  end

  private
    def product_params
      params.expect(product: [ :name, :price ])
    end

    def record_not_found
      redirect_to products_path
    end
end
