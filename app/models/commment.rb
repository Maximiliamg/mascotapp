class Commment < ApplicationRecord

  validates :commment, presence: true, on: :create

  belongs_to :user
  belongs_to :product

end
