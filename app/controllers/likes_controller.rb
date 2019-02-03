class LikesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    @like = current_user.likes.build(likeable_type: params[:likeable_type],
                                      likeable_id: params[:likeable_id])
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
    @like = Like.find_by(id: params[:id])
    @like.destroy
    respond_to do |format|
      format.html { redirect_to request.referrer || root_url }
      format.js
    end
  end
end
