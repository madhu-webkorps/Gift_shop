class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

       has_one_attached :image
       has_many :orders

      def to_s 
        email
      end

      after_create do
        customer = Stripe::Customer.create(email: email)
        update(stripe_customer_id: customer.id)
      end

      
      enum role: [:user , :admin]
      
      after_initialize :set_default_role, :if => :new_record?

      def set_default_role
        self.role ||= :user
      end

      

end
