class MatchupWinnerJob < ApplicationJob
  queue_as :default

  def perform(matchup_id, winner_id)
    @matchup = Matchup.find(matchup_id)
    update_matchup_winner
    create_next_round
    create_next_matchup
  end

  def update_matchup_winner
    @matchup.winner_id = winner_id
    @matchup.save
  end

  def create_next_matchup
  end

  def create_next_round
    @round = @matchup.round
    @template_bracket = @round.template_bracket
    @template_bracket.create_next_round if @template_bracket.current_round == @round
  end
end