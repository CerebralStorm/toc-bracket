class Chef < ApplicationRecord
  scope :from_region, -> (region) { where(region: region) }
end
