class User < ApplicationRecord
  ###
  ## Relations
  ###
  has_many :created_challenges, class_name: 'Challenge', foreign_key: :creator_id, inverse_of: :creator, dependent: :destroy

  ###
  ## Validations
  ###
  validates :nickname, :email, presence: true
end
