class LikesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    @like = current_user.likes.build(like_params)
    if @like.save
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js
      end
    else
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js { render action: "failed_create" }
      end
    end
  end

  def destroy
  end

  private

    def like_params
      params.require(:like).permit(:likeable_type, :likeable_id)
    end
end
