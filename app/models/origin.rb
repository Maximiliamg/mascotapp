class Origin < ApplicationRecord

  validates :country, :state, :city, :postal_code, :address, presence: true, on: :create

  belongs_to :user

  before_save :format_downcase

  protected
  def format_downcase
    self.country.downcase!
    self.state.downcase!
    self.city.downcase!
    self.address.downcase!
  end
end
