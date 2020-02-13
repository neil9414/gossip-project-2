class UsersController < ApplicationController
  include UsersHelper
  before_action :authenticate_user!, only: [:show]
  before_action :right_user

  def show

    if params[:id].to_i == current_user.id.to_i
      @current_user = current_user
      @my_admin_events = Event.where(admin_id: params[:id])
    else
      redirect_to root_url
    end
 
  end

  def index
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
