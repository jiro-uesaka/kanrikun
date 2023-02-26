class Worker < ApplicationRecord
    belongs_to :shop
    has_many :shifts
    
    # レイアウトが大きく崩れないよう字数制限
    validates :name, presence: true, length: { maximum: 4 }
    
end
