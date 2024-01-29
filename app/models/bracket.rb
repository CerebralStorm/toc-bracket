class Bracket < ApplicationRecord
  belongs_to :league
  belongs_to :user
  has_many :matchups

  ENV['CURRENT_BRAKET_TEMPLATE'] = 'Template2024'

  after_create :setup_matches

  def setup_matches
    ENV['CURRENT_BRAKET_TEMPLATE'].constantize.new(user).create_bracket
  end

end