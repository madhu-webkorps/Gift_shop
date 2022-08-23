class Product < ApplicationRecord
    belongs_to :category

    # validates :name, presence: true
    validates :name, 
          :presence => {:message => "Title can't be blank." },
          :uniqueness => {:message => "Title already exists."}
          # :length => { :maximum => 100, :message => "Must be less than 100 characters"} belongs_to :user
    
    # has_many :cart_products
    has_many :cart_products, dependent: :destroy

    has_one_attached :image

    def to_builder
        Jbuilder.new do |product|
          product.price stripe_price_id
          product.quantity 1
        end
    end
end
