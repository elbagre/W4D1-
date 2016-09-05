class UsersController < ApplicationController
  def index
    render json: User.all
  end

  def show

    ##?? OR -> if params[:id] > User.last.id .....

    begin
      render json:  User.find(params[:id])
    rescue
      render(
        json: 'No such user', status: :not_found
      )
    end
  end

  def create
    @user = User.new(user_params)

    if @user.save!
      render json: @user
    else
      render(
        json: @user.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to '/users'
    else
      render(
        json: user.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update!(user_params)
    render json: @user
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
