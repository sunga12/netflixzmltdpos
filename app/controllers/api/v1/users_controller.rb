class Api::V1::UsersController < ApplicationController

  #GET /users
  def index
    @users = User.all
    
    if @users
      render json: @users, status: :ok
    else
      render json: { error: 'Users not found' }, status: :not_found
    end
  end

  #GET /users/1
  def show
    render json: @user
  end

  #POST /users
  def create
    @user =  User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @group.errors, status: :unprocessable_entity
    end
  end

  #PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @group
    else
      render json: @group.errors, status: :unprocessable_entity
    end
  end

  #DELETE /users/1
  def destroy
    @user.destroy
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through
  def user_params
    params.require(:user).permit(:username, :role, :fullname)
  end
end
