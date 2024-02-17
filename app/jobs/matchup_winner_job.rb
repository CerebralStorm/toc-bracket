class MatchupWinnerJob < ApplicationJob
  queue_as :default

  def perform(matchup_id, winner_id)
    @winner_id = winner_id
    @matchup = Matchup.find(matchup_id)
    update_matchup_winner
    create_next_matchup
    update_brackets
  end

  def update_matchup_winner
    @matchup.winner_id = @winner_id
    @matchup.save
  end

  def create_next_matchup
    return unless @matchup.parent.present?
    new_matchup = @matchup.parent
    new_matchup.update(region: @matchup.region)
    new_matchup_chef = new_matchup.matchup_chefs.where(chef_id: @matchup.winner_id).first_or_create
  end

  def update_brackets
    @matchup.matchup_selections.find_each do |matchup_selection|
      matchup_selection.build_score(@matchup.winner_id)
    end
  end
end