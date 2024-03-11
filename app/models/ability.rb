class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # гость

    if user.has_role? :admin
      can :manage, Crm
    elsif user.has_role? :user
      can :read, Crm
    end
  end
end