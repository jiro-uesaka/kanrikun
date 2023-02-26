class Pattern < ApplicationRecord
    belongs_to :shop
    
    # レイアウトが大きく崩れないよう字数制限
    validates :name, presence: true, length: { maximum: 3 }
    validates :start_time, presence: true
    validates :end_time, presence: true
    validates :rest_time, presence: true
    validates :status, presence: true
    
end
