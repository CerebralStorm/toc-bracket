class MatchupSelection < ApplicationRecord
  belongs_to :user
  belongs_to :bracket
  belongs_to :matchup
end
