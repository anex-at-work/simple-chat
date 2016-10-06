class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def update
    User.find(params[:id]).update! user_params
    ActionCable.server.broadcast 'users', user_params: {
      nickname: user_params[:nickname],
      id: params[:id]
    }
    respond_to do |format|
      format.json { head :ok }
    end
  end

  def scenario_jquery_interval
    users = User.where.
      not(id: params[:users].keys).
      or(User.where.not(nickname: params[:users].values)).
      select(:id, :nickname)
    respond_to do |format|
      format.json { render json: users, status: :ok }
    end
  end

  private
    def user_params
      params.require(:users).permit :nickname
    end
end
