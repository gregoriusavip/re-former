class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # @user = User.new(username: params[:username], email: params[:email], password: params[:password])

    # @user = User.new(allowed_user_params) hash params from html form

    @user = User.new(allowed_user_params)

    if @user.save
      redirect_to new_user_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(allowed_user_params)
      redirect_to new_user_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  private

  def allowed_user_params
    params.expect(user: [ :username, :email, :password ])
  end
end
