class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :league_users
  has_many :leagues, through: :league_users
  has_many :brackets
  has_many :matchup_selections

  def league_bracket(league)
    brackets.where(league: league).first
  end

  def matchup_selection(matchup, bracket)
    matchup_selections.where(matchup: matchup, bracket: bracket).first_or_create
  end
end
