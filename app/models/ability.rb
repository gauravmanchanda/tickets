class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.is_a? Admin
      can :manage, :all
    elsif user.is_a? Agent
      can :manage, Ticket, agent_id: user.id
      cannot :assign, Ticket
    elsif user.is_a? Customer
      can :create, Ticket, customer_id: user.id
      cannot :assign, Ticket
    end
  end
end
