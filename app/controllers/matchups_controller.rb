class MatchupsController < ApplicationController
  before_action :set_matchup, only: %i[ show edit update destroy ]

  # GET /matchups or /matchups.json
  def index
    @matchups = Matchup.all
  end

  # GET /matchups/1 or /matchups/1.json
  def show
  end

  # GET /matchups/new
  def new
    @matchup = Matchup.new
  end

  # GET /matchups/1/edit
  def edit
  end

  # PATCH/PUT /matchups/1 or /matchups/1.json
  def update
    respond_to do |format|
      if @matchup.update(matchup_params)
        format.html { redirect_to bracket_url(@matchup.bracket), notice: "Matchup was successfully updated." }
        format.json { render :show, status: :ok, location: @matchup }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @matchup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matchups/1 or /matchups/1.json
  def destroy
    @matchup.destroy!

    respond_to do |format|
      format.html { redirect_to matchups_url, notice: "Matchup was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_matchup
      @matchup = Matchup.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def matchup_params
      params.require(:matchup).permit(:bracket_id, :winner_id)
    end
end
