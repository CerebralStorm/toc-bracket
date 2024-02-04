class League < ApplicationRecord
  belongs_to :owner, foreign_key: :owner_id, class_name: 'User'
  has_many :league_users, dependent: :destroy
  has_many :users, through: :league_users

  after_create :add_owner_as_league_user

  def add_owner_as_league_user
    league_users.where(user_id: owner_id).first_or_create!
  end
end