class UsersController < ApplicationController
  def new
  end
  def create
    # @user = User.new(username: params[:username], email: params[:email], password: params[:password])

    @user = User.new(allowed_user_params)

    if @user.save
      redirect_to new_users_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def allowed_user_params
    params.expect(user: [ :username, :email, :password ])
  end
end
