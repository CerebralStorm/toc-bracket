class Matchup < ApplicationRecord
  belongs_to :bracket
  has_many :matchup_chefs
  has_many :chefs, through: :matchup_chefs
end
