class AnimalFound < ApplicationRecord
  belongs_to :animal

  validates :name, presence: true, length: {minimum: 5}
  validates :phone, presence: true, length: {minimum: 10}
  validates :animal_id, presence: true
end
