class Bracket < ApplicationRecord
  belongs_to :league
  belongs_to :user
  has_many :matchups, dependent: :destroy
  has_many :chefs, through: :matchups

  ENV['CURRENT_BRAKET_TEMPLATE'] = 'Template2024'

  after_create :setup_matches

  def setup_matches
    ENV['CURRENT_BRAKET_TEMPLATE'].constantize.new(user).create_bracket
  end

  def matchups_by_region(region)
    matchups.order(:created_at).from_region(region)
  end
end