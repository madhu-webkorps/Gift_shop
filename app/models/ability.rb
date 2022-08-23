# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Product, public: true

    return unless user.present?  # additional permissions for logged in users (they can read their own Products)
    can :read, Product, user: user

    return unless user.admin?  # additional permissions for administrators
    can :read, Product
  end
end
