class Challenge < ApplicationRecord
  ###
  ## Relations
  ###
  belongs_to :category
  belongs_to :creator, class_name: 'User', inverse_of: :created_challenges

  ###
  ## Validations
  ###
  validates :category, :creator, :kind, presence: true
  validates :kind, inclusion: { in: ['tournament', 'season', 'open'] }
end
