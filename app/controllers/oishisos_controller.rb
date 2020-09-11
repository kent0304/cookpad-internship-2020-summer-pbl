class OishisosController < ApplicationController
    def create 
        @oishiso = current_user.oishisos.create(post_id: params[:post_id])
        redirect_back(fallback_location: root_path)
    end

    def destroy
        @oishiso = Oishiso.find_by(post_id: params[:post_id], user_id: current_user.id)
        @oishiso.destroy 
        redirect_back(fallback_location: root_path)
    end
end
