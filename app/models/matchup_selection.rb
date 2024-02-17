class MatchupSelection < ApplicationRecord
  belongs_to :user
  belongs_to :bracket
  belongs_to :matchup

  def build_score(actual_winner_id)
    if winner_id == actual_winner_id
      update(score: 1 * matchup.round_number) 
    else
      update(score: 0)
    end
  end

  after_save :update_next_round

  def update_next_round
    next_selection = MatchupSelection.where(bracket_id: bracket_id, matchup_id: matchup.parent_id, user_id: user_id).first_or_create
    next_selection.update(winner_id: winner_id)
  end
end
