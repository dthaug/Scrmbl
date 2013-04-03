class ScramblesController < ApplicationController

  before_filter :signed_in_business, only: [:create, :destroy]
  before_filter :correct_business,   only: :destroy

  

  def create
    @scramble = current_business.scramble.create(params[:scramble])
    if @scramble.save
      flash[:success] = "ScrambleBox created!"
      redirect_to scramble_path(@scramble)
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @scramble.destroy
    redirect_to root_url
  end

  private

    def correct_business
      @scramble = current_business.scramble.find_by_id(params[:id])
      redirect_to root_url if @scramble.nil?
    end
end

