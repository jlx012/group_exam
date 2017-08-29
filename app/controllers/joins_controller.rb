class JoinsController < ApplicationController
  def create
      @group = Group.find(params[:id])

      Join.create(user: current_user, group: @group)

      return redirect_to :back
  end

  def destroy
    @group = Group.find(params[:id])

    Join.find_by(group: @group, user: current_user).delete

    return redirect_to :back
  end
end
