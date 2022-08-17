class Product < ApplicationRecord
    belongs_to :category,  foreign_key: "category_id"
    # belongs_to :user

    has_one_attached :image
end
