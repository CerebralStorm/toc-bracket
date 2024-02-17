class Matchup < ApplicationRecord
  belongs_to :template_bracket
  belongs_to :winner, class_name: 'Chef', optional: true

  acts_as_tree

  has_many :matchup_chefs, dependent: :destroy
  has_many :chefs, through: :matchup_chefs
  has_many :matchup_selections

  scope :from_region, -> (region) { where(region: region) }
end
