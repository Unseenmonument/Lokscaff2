class UserController < ApplicationController
  before_action :set_user, only: [:show, :follow, :unfollow]
  before_action :authenticate_user!


  def friends
  end

  def tottles
    @user = User.find(params[:id])
    @tottles = Tottles.all
  end

  def rumes
    @user = User.all
    @rumes = Rume.all
  end

  def convos

    @users = User.all
    @convos = Convo.all
  end

  def comments
    @user = User.all
    @comments = Comment.all

  end

  def events
  end

  def favorites
  end

  def show

  end

  def follow
    current_user.following.push(@user.id)
    current_user.save

    redirect_to user_path(@user)
  end

  def unfollow
    current_user.following.delete(@user.id)
    current_user.save

    redirect_to user_path(@user)
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).
    end
  end
end