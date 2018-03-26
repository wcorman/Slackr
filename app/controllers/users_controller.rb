class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
      flash[:notice] = "Thank you for signing in!"
    else
      render :new
    end
  end

  def show
    @user = User.find params[:id]
    @slacks = Slack.order(created_at: :desc)
  end


  private

  def is_admin?
    self.user_role == 1
  end


  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation
    )
  end
end
