class Category < ApplicationRecord
   
    has_many :product, foreign_key: "reference_id"

end
