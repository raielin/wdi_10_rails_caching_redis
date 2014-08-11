class Product < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  validates :name, :description, presence: true
  validates :price, numericality: { greater_than: 0 }
end
