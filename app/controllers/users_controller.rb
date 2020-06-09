class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(current_user.id)
    @user_details = @user.user_detail

    create unless @user_details
  end

  def new; end

  def create
    @user_details = UserDetail.create(empty_details_params)
  end

  def edit
    @user_details = User.find(params[:id]).user_detail

    # render 'show' unless current_user_is_owner?(@crew)
  end

  def update
    @user_details = UserDetail.find(params[:id])

    if @user_details.update(params)
      redirect_to user_path(@user_details.user_id)
    else
      render 'edit'
    end
  end

  private

  NO_DATA = '-'.freeze

  # def user_details_params
  #   params.require(:user_detail).permit(:nickname, :name, :first_name, :user_id)
  # end

  def empty_details_params
    params[:user_details] = {
      nickname: NO_DATA,
      name: NO_DATA,
      first_name: NO_DATA,
      user_id: current_user.id
    }
  end
end
