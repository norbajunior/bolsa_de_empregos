class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :read, :all
    cannot :read, [Offer, News], active: false

    if user.backoffice?
      can :manage, :all
      cannot :manage, [Interest, Application] # [Interest, Applies]
      cannot :read, :entity_interest_buttons
      cannot :read, :candidate_interest_buttons
      cannot :read, :application_button
    elsif user.candidate?
      cannot :new, User
      cannot :create, Candidate
      cannot :manage, Interest, user_id: user.id
      cannot :read, :candidate_interest_buttons

      can [:dashboard, :update], Candidate, id: user.id

      can [:create, :destroy], Application, candidate_id: user.id
      can :manage, Interest, interested_id: user.id
      can :manage, :password_reset
    elsif user.entity?
      cannot :new, User
      cannot :create, Entity
      cannot [:create, :destroy], Interest, user_id: user.id
      cannot :read, :entity_interest_buttons
      cannot :read, :application_button
      cannot [:create, :destroy], Application
      
      can [:dashboard, :update], Entity, id: user.id
      can :manage, Interest, interested_id: user.id
      can :manage, Offer,    entity_id: user.id
      can :manage, :password_reset
    else
      can :create, [Candidate, Entity]
      can :new, User
      cannot :manage, :password_reset
      cannot :read, :entity_interest_buttons
      cannot :read, :candidate_interest_buttons
      cannot :read, :application_button
    end
  end
end
