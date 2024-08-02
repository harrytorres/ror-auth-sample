# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new 

    if user.has_role? :admin
      can :manage, :all

    elsif user.is_a?(Author)
      can :read, Book
      can :create, Book
      can :update, Book, user_id: user.id
    
    else 
      cannot :read, Book
      cannot :create, Book
      cannot :update, Book
      cannot :destroy, Book

    end

    
    # return unless user.present?
    #   can [:read, :create], Book, user_id: user.id
    
    # return unless user.admin?
    #   can [:read, :update], Article 

  end
end
