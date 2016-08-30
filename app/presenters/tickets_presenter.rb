class TicketsPresenter

  def initialize(ticket)
    @ticket = ticket
  end

  def state
    @ticket.aasm_state.capitalize
  end
end