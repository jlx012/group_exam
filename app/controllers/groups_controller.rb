class GroupsController < ApplicationController
  def show
      @all_joins = Join.all
      @group = Group.find(params[:id])
  end

  def index
      @all_groups = Group.joins('left join joins on joins.group_id = groups.id').group(:id).order('count(joins.id) desc')
  end

  def create
      @group = Group.new(group_params)

      if @group.save
          flash[:notice] = ["New event created"]

          return redirect_to groups_path
      end

      errors = @group.errors.full_messages

      flash[:errors] = errors

      return redirect_to :back
  end

  def destroy
    @group = Group.find(params[:id])

    @group.delete

    return redirect_to groups_path
  end


  private
      def group_params
          params.require(:group).permit(:name, :description).merge(user: current_user)
      end
end
