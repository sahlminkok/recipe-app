class Food < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy
  has_many :recipes, through: :recipe_foods

  validates :name, presence: true
  validates :price, presence: true
  validates :measurement_unit, presence: true
  validates :price, :quantity, numericality: { greater_than_or_equal_to: 0 }
  validates :quantity, numericality: { only_integer: true }
end
