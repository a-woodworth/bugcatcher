class ProfilesController < ApplicationController
  # Remove this one you integrate Devise
  helper_method :current_user

  def update
    respond_to do |format|
      if current_user.update(user_params)
        format.html { redirect_to profile_url, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: current_user }
      else
        format.html { render :edit }
        format.json { render json: current_user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy

    current_user.destroy
    respond_to do |format|
      format.html { redirect_to profile_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Remove this one you integrate Devise
    def current_user
      User.first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :bio, :email, :github, :linkedin, :twitter, :facebook, :avatar)
    end
end