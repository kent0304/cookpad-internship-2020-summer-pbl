class TellmesController < ApplicationController
    def create 
        @tellme = current_user.tellmes.create(post_id: params[:post_id])
        redirect_back(fallback_location: root_path)
    end

    def destroy
        @tellme = Tellme.find_by(post_id: params[:post_id], user_id: current_user.id)
        @tellme.destroy 
        redirect_back(fallback_location: root_path)
    end
end
