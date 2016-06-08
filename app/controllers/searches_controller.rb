class SearchesController < ApplicationController
  before_action :set_search, only: [:show]

  def new
    @search = Search.new
  end

  def create
    @search = Search.new

    respond_to do |format|
      if @search.save
        format.html { redirect_to @search, notice: 'Search processed' }
        format.json { render :show, status: :created, location: @search }
      else
        format.html { render :new }
        format.json { render json: @search.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  private

  def set_search
    @search = Search.find(params[:id])
  end

  def search_params
    params.require(:search).permit(:username, :gist_id)
  end
end
