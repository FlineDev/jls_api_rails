class Challenge < ApplicationRecord
  ###
  ## Relations
  ###
  belongs_to :category
  belongs_to :creator, class_name: 'User', inverse_of: :created_challenges

  ###
  ## Validations
  ###
  validates :category, :creator, :type, presence: true
  validates :type, inclusion: { in: ['tournament', 'season', 'open'] }
end
