# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show; end

  def new
    @user = User.new
  end

  def edit; end
  
  def showall; end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to request.referer, notice: "#{@user.full_name} updated" }

      else
        format.html { render(:edit, status: :unprocessable_entity) }
      end
    end
  end

  # DELETE /members/1 or /members/1.json
  def destroy
    @user.destroy!

    respond_to do |format|
      format.html { redirect_to(users_path, notice: 'User was successfully destroyed.') }
      format.json { head(:no_content) }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:grade, :classification_id, :phone, :points)
  end
end
