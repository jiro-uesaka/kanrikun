class Item < ApplicationRecord
    belongs_to :shop
    has_many :orders
    validates :name, presence: true
end
