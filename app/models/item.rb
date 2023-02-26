class Item < ApplicationRecord
    
    belongs_to :shop
    # 商品が消えても発注の履歴は残す
    has_many :orders
    
    validates :name, presence: true
    validates :price, presence: true
    validates :stock, presence: true
    validates :status, presence: true
    
end
