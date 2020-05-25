class Animal < ApplicationRecord
    belongs_to :owner
    has_many :animal_founds

    mount_uploader :photo, ImageUploader

    validates :photo, presence: true, on: :create
    validates :name, presence: true
    validates :city, presence: true
    validates :state, presence: true
    validates :status, presence: true
    validates :owner_id, presence: true
end
