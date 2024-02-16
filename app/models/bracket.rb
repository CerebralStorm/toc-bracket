class Bracket < ApplicationRecord
  belongs_to :template_bracket
  belongs_to :league
  belongs_to :user
  has_many :matchup_selections

  def matchups_by_region(region)
    Matchup.order(:created_at).from_region(region)
  end
end