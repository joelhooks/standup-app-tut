class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :set_users, only: [:index]

  def index
  end

  def show
  end

  def new
    @user = User.new
    set_choices
  end

  def me
    @user = current_user
  end

  def create
    @User.unscoped.new(user_params.except('role'))
    @user.account = current_account
    @user.password = 'password123'

    respond_to do |format|
      
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params.except('role'))
        format.html {
          redirect_to account_users_path,
          notice: 'User was successfully updated!'
        }
      else
        set_choices
        format.html {render :edit}
      end
    end
  end

  private
  def set_users
    @users = current_account.users
  end

  def set_user
    @user = User.find(params[:id])
  end
end
