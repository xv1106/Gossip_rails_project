class PrivateMessage < ApplicationRecord
  has_many :recipients
  belongs_to :sender, class_name: 'User'
  belongs_to :recipient, class_name: 'User'
end