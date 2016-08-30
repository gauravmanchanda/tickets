class Agent < User
  has_many :tickets, class_name: 'Ticket', foreign_key: 'agent_id'

  ## Find agent with least amount of tickets assigned
  def self.lazy
    self.includes(:tickets).sort {|a,b| a.tickets.size <=> b.tickets.size}.first
  end
end
