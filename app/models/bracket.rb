class Bracket < ApplicationRecord
  belongs_to :template_bracket
  belongs_to :league
  belongs_to :user
  has_many :matchup_selections

  def matchups_by_region(region)
    Matchup.order(:created_at).from_region(region)
  end

  def matchups_by_round_and_region(round, region)
    Matchup.order(:created_at).where(round_number: round).from_region(region).uniq
  end

  def rounds
    Matchup.pluck(:round_number).uniq.sort
  end

  def score
    matchup_selections.sum(&:score)
  end
end