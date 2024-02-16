class TemplateBracket < ApplicationRecord
  has_many :matchups, dependent: :destroy
  has_many :brackets, dependent: :destroy

  def self.current
    where(active: true).first
  end
end
