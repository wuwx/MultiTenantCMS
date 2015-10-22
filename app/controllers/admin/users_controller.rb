class Admin::UsersController < Admin::ApplicationController
  inherit_resources

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end
