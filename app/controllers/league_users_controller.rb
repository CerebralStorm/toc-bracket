class LeagueUsersController < ApplicationController
  before_action :set_league_user, only: %i[ destroy ]

  # POST /league_users or /league_users.json
  def create
    @league_user = LeagueUser.new(league_user_params)
    respond_to do |format|
      if @league_user.save
        format.html { redirect_to league_url(@league_user.league), notice: "LeagueUser was successfully created." }
        format.json { render :show, status: :created, location: @league }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @league_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /league_users/1 or /league_users/1.json
  def destroy
    league_id = @league_user.league_id
    @league_user.destroy!

    respond_to do |format|
      format.html { redirect_to league_url(league_id), notice: "LeagueUser was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_league_user
      @league_user = LeagueUser.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def league_user_params
      params.require(:league_user).permit(:email, :league_id)
    end
end
