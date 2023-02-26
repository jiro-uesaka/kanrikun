class Shop < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
        #  退会するとデータはすべて消す
         has_many :sales, dependent: :destroy
         has_many :items, dependent: :destroy
         has_many :patterns, dependent: :destroy
         has_many :shifts, dependent: :destroy
         has_many :workers, dependent: :destroy
         has_many :order, dependent: :destroy
end
