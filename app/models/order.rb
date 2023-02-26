class Order < ApplicationRecord
    belongs_to :item
    
    validates :amount, presence: true
end
