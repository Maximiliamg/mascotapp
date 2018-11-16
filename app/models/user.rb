class User < ApplicationRecord
  has_secure_password

  validates :email, :username, :password, :name, :birthdate, presence: true, on: :create
  validates :email, :username, uniqueness: true

  before_save :format_downcase

  belongs_to :picture, optional: true, dependent: :destroy

  has_many :tokens, dependent: :destroy
  has_many :origins, dependent: :destroy
  has_many :products, dependent: :destroy
  has_many :commments, dependent: :destroy

  has_many :sold_products, :class_name => 'Purchase', :foreign_key => 'seller_id'
  has_many :bought_products, :class_name => 'Purchase', :foreign_key => 'buyer_id'
  
  has_one :blocked_user, dependent: :destroy

  def self.search(search)
    where("email LIKE ? OR username LIKE ?", "%#{search}%", "%#{search}%").order("created_at DESC")
  end

  protected
  def format_downcase
    self.name.downcase!
    self.email.downcase!
    self.username.downcase!
  end
end
