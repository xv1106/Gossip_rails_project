class Tag < ApplicationRecord
  has_and_belongs_to_many :gossip, dependent: :destroy
end