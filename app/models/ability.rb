class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :read, :all
    can :read, [Offer, News], active: true

    if user.backoffice?
      can :manage, :all
      cannot :manage, [Interest] # [Interest, Applies]
    elsif user.candidate?
      cannot :new, User
      cannot :create, Candidate
      cannot [:read, :create, :destroy], Interest, user_id: user.id

      can [:dashboard, :update], Candidate, id: user.id

      can :manage, Interest, interested_id: user.id
    elsif user.entity?
      cannot :new, User
      cannot :create, Entity
      cannot [:create, :destroy], Interest, user_id: user.id

      can [:dashboard, :update], Entity, id: user.id
      can :manage, Interest, interested_id: user.id
      can :manage, Offer,    entity_id: user.id
    else
      can :create, [Candidate, Entity]
      can :new, User
    end
  end
end
