class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :league_users
  has_many :leagues, through: :league_users
  has_many :brackets

  def league_bracket(league)
    brackets.where(league: league).first
  end
end
