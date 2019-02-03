class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

  def create
    @micropost = current_user.microposts.build(micropost_params)
    @comment =  Comment.new
    if @micropost.save
      respond_to do |format|
        format.html { redirect_to root_url }
        format.js
      end
    else
      # fallback
      flash[:danger] = "Invalid micropost."
      redirect_to root_url
    end
  end

  def destroy
    @micropost.destroy
    respond_to do |format|
      format.html { redirect_to request.referrer || root_url }
      format.js
    end
  end

  private

    def micropost_params
      params.require(:micropost).permit(:content, :picture)
    end

    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end
end
