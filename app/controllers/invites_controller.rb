class InvitesController < ApplicationController
  load_and_authorize_resource :invite

  def update
    respond_to do |format|
      if @invite.update_attributes(params[:invite])
        format.html { redirect_to :back }
        format.json { render json: @invite }
      else
        format.html { redirect_to :back }
        format.json { render json: @invite.errors, status: :unprocessable_entity }
      end
    end
  end
end
