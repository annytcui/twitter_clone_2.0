class LikesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    @likeable_type = params[:likeable_type]
    @likeable_id = params[:likeable_id]
    @like = current_user.likes.build(likeable_type: @likeable_type,
                                      likeable_id: @likeable_id)
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
    @likeable_type = @like.likeable_type
    @likeable_id = @like.likeable_id
    @like.destroy
    respond_to do |format|
      format.html { redirect_to request.referrer || root_url }
      format.js
    end
  end
end
