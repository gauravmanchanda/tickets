class HomeController < ApplicationController

  def index
    if user_signed_in?
      user_tickets = current_user.tickets
      @unresolved_tickets_count = user_tickets.unresolved.size
      @resolved_tickets_count = user_tickets.size - @unresolved_tickets_count
    end
  end
end