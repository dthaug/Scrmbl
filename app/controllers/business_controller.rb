class BusinessController < ApplicationController
	  before_filter :signed_in_business, only: [:index, :edit, :update, :destroy]
      before_filter :correct_business,   only: [:edit, :update]
      before_filter :admin_business,     only: :destroy

 def show
	 @business = Business.find(params[:id])
   end

def destroy
  Business.find(params[:id]).destroy
  flash[:success] = "Business deleted!"
  redirect_to businesss_path
end

def edit
end

def update
  @business = Business.find(params[:id])
  if @business.update_attributes(params[:business])
    flash[:success] = "Profile updated"
    sign_in @business
    redirect_to @business
  else
    render 'edit'
  end
end

def index
  @businesss = Business.paginate(page: params[:page])
end


 def new
    @business = Business.new
  end

  def create
  	 @business = Business.new(params[:business])
  	 if @business.save
      sign_in @business
  	 	flash[:success] = "Welcome to ScrambleBox!"
  	 	redirect_to @business
  	 else
  	 	render 'new'
  end
 end

 private
  
  def signed_in_business
    unless signed_in?
      store_location
      redirect_to signin_path, notice: "Please sign in."
  end
end

  def correct_business
    @business = Business.find(params[:id])
    redirect_to (root_path) unless current_business?(@business)
  end

  def admin_business
    redirect_to(root_path) unless current_business.admin?
  end
  
end
