require "csv"

class QuartersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    @quarters = Quarter.all
  end

  def show
    @quarter = Quarter.find(params[:id])
    render :index unless @quarter
  end

  def new
    @quarter = Quarter.new
  end

  def create
    @found_quarter = Quarter.find_by(quarter_params)
    if @found_quarter
      @quarter = Quarter.new
      render :new, status: :unprocessable_entity
    else
      @quarter = Quarter.new(quarter_params)
      if @quarter.save
        redirect_to @quarter
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  def export
    @quarters = Quarter.all

    respond_to do |format|
      format.csv do
        response.headers["Content-Type"] = "text/csv"
        response.headers["Content-Disposition"] = "attachment; filename=quarters.csv"
        render template: "quarters/export"
      end
    end
  end

  private
    def quarter_params
      params.expect(quarter: [ :year, :quarter_num ])
    end

    def record_not_found
      redirect_to quarters_path
    end
end
