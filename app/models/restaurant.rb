class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy

  validates :category, inclusion: { in: ["chinese", "italian", "japanese", "french", "belgian"] }
  validates :name, :category, :address, presence: true

end
