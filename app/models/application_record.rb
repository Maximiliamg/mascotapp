class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  enum role: [:normal , :admin]
  enum gender: [:other, :female, :male]
  enum category: [
    :clothing_shoes_and_accessories,
    :toys,
    :everything_else
	]
end
