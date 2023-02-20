class Sale < ApplicationRecord
    belongs_to :shop
    validates :proceed, presence: true
    validates :created_at, presence: true
end
