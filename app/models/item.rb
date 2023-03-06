class Item < ApplicationRecord
    
    belongs_to :shop
    has_many :orders
    # 商品が消えても発注の履歴は残す
    has_many :tags, dependent: :destroy
    
    has_one_attached :image
    
    validates :name, presence: true
    validates :price, presence: true
    validates :stock, presence: true
    validates :status, presence: true
    
end
