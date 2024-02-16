class MatchupChef < ApplicationRecord
  belongs_to :matchup 
  belongs_to :chef

  def matchup_label
    "#{chef.name} - #{seed}"
  end
end
