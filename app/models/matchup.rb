class Matchup < ApplicationRecord
  belongs_to :bracket
  has_many :matchup_chefs, dependent: :destroy
  has_many :chefs, through: :matchup_chefs

  scope :from_region, -> (region) { joins(:matchup_chefs).where('matchup_chefs.region = ?', region).uniq }
end
