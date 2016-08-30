class Admin < User

  def tickets
    Ticket.all
  end
end
