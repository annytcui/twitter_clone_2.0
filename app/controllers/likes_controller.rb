class LikesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
  end

  def destroy
  end

  private

    def like_params
      params.require(:like).permit(:likeable_type, :likeable_id)
    end
end
