class Category < ApplicationRecord
   
    has_many :product,  dependent: :destroy
    validates :name , uniqueness: true , presence: true


end
