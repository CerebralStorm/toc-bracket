class Matchup < ApplicationRecord
  belongs_to :template_bracket

  acts_as_tree

  has_many :matchup_chefs, dependent: :destroy
  has_many :chefs, through: :matchup_chefs

  scope :from_region, -> (region) { where(region: region) }
end
