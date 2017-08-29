class UsersController < ApplicationController
  def create
      @user = User.create(user_params)

      if @user.save
          flash[:notice] = ["You have registered"]

          session[:user_id] = @user.id

          return redirect_to groups_path
      end

      errors = @user.errors.full_messages

      flash[:errors] = errors

      return redirect_to :back
  end

  private
      def user_params
          params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
      end
end
