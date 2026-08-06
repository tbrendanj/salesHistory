require "csv"

class SalesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    @sales = Sale.all
  end

  def show
    @sale = Sale.find(params[:id])
  end

  def new
    @sale = Sale.new
  end

  def create
    @sale = Sale.new(sale_params)
    if @sale.save
      redirect_to @sale
    else
      render :new, status: :unprocessable_entity
    end
  end

  def export
    @sales = Sale.all

    respond_to do |format|
      format.csv do
        response.headers["Content-Type"] = "text/csv"
        response.headers["Content-Disposition"] = "attachment; filename=sales.csv"
        render template: "sales/export"
      end
    end
  end

  private
    def sale_params
      params.expect(sale: [ :Product_id, :Quarter_id, :quantity ])
    end

    def record_not_found
      redirect_to sales_path
    end
end
