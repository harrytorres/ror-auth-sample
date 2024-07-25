# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new 

    if user.admin?
      can :manage, :all
    else
      can [:read, :manage], User, id: user.id
    end

    
    return unless user.present?
      can [:read, :create], Book, user_id: user.id
    
    # return unless user.admin?
    #   can [:read, :update], Article 

  end
end
