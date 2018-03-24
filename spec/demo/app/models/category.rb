class Category < ApplicationRecord
  ###
  ## Relations
  ###
  has_many :challenges, dependent: :destroy

  ###
  ## Validations
  ###
  validates :name, presence: true, uniqueness: true
end
