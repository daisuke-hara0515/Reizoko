class Stock < ApplicationRecord
    with_options presence: true do
        validates :name
        validates :stock
        validates :unit
    end
end
