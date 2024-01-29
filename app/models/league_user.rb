class LeagueUser < ApplicationRecord
  belongs_to :league
  belongs_to :user

  attr_accessor :email

  before_validation :populate_email_user

  def populate_email_user
    return unless email.present? && user.nil?
    user = User.where(email: email).first
    self.user_id = user.id
  end
end