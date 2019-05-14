class MaintenanceItem < ApplicationRecord

    belongs_to :vehicle,
        primary_key: :id, 
        foreign_key: :vehicle_id,
        class_name: :Vehicle

    belongs_to :user

    validates_presence_of :title, :date_preformed, :vehicle_id, :user_id

end 