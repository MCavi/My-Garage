class Vehicle < ApplicationRecord

    validates :year, :make, :model, presence: true

    has_many :maintenance_items

    belongs_to :user
    
end 