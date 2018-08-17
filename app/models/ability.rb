# frozen_string_literal: true

# Ability class
class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.has_role? :admin
      can :manage, :all
    else
      can :displays, @questions
      can :change_question, @questions
      can :result, @questions
      can :view_solutions, @solutions
      can :read, :all
    end
  end
end
