class ChefsController < ApplicationController
  before_action :set_chef, only: %i[ show destroy ]

  def index
    @chefs = Chef.all
  end

  def show
  end

  # DELETE /chefs/1 or /chefs/1.json
  def destroy
    @chef.destroy!

    respond_to do |format|
      format.html { redirect_to chefs_url, notice: "Chef was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chef
      @chef = Chef.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def chef_params
      params.require(:chef).permit(:name)
    end
end
