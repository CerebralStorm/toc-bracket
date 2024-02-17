class MatchupSelectionsController < ApplicationController
  before_action :set_matchup_selection, only: %i[ show update destroy ]

  def show
  end

  def update
    respond_to do |format|
      if @matchup_selection.update(matchup_selection_params)
        format.html { redirect_to bracket_url(@matchup_selection.bracket, round_number: cookies[:round_number]), notice: "Matchup was successfully updated." }
        format.json { render :show, status: :ok, location: @matchup_selection }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @matchup_selection.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @matchup_selection.destroy!

    respond_to do |format|
      format.html { redirect_to matchups_url, notice: "Matchup was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_matchup_selection
      @matchup_selection = MatchupSelection.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def matchup_selection_params
      params.require(:matchup_selection).permit(:winner_id)
    end
end
