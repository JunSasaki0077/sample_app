class RelationshipsController < ApplicationController
  before_action :logged_in_user

  # POST /relationships
  def create
    @user = User.find(params[:followed_id])
    current_user.follow(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js   # => app/views/relationships/create.je.erb
    end
  end

  # DELETE /relationships/:id
  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js   # => app/view/relationships/destroy.js.erb
    end
  end
end