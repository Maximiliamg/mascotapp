class BlockedProduct < ApplicationRecord
	validates :blocked_quantity, presence: true, on: :create

	belongs_to :product
end
