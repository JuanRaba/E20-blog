class PagesController < ApplicationController
  authorize_resource :class => "User"
  def dashboard
    @users = User.all
  end

  def addtoadmin
    @user = User.find(params[:id])
    @user.admin!
    redirect_to pages_dashboard_path
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to pages_dashboard_path
  end

  def removeadmin
    @user = User.find(params[:id])
    @user.visit!
    redirect_to pages_dashboard_path
  end
end
