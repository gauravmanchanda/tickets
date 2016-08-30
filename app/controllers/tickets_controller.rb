class TicketsController < ApplicationController
  before_action :set_ticket, except: [:index, :new, :create, :resolved_report]
  before_action :authenticate_user!

  # GET /tickets
  def index
    @tickets = current_user.tickets
  end

  # GET /tickets/1
  def show
  end

  def new
    @ticket = Ticket.new
  end

  # POST /tickets
  def create
    @ticket = the_tickets.new(ticket_params)
    if params[:customer_email]
      if customer = Customer.find_by(email: params[:customer_email])
        @ticket.customer_id = customer.id
        @ticket.assign
      else
        flash[:danger] = "Customer Email is Invalid"
        render :new and return
      end
    end
    if @ticket.save
      redirect_to tickets_path, notice: "Ticket created successfully."
    else
      redirect_to tickets_path, error: "Unable to create Ticket. Please try again."
    end
  end

  def assign
    @ticket.assign_to_agent
    @success = @ticket.save
  end

  def next_event
    if @ticket.valid_next_event?(params[:event])
      @ticket.send "#{params[:event].to_sym}!"
      @success = true
    else
      @success = false
    end
  end

  def resolved_report
    @tickets = Ticket.resolved.closed_in_last_month
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "#{Time.zone.now.to_s(:custom)}-resolved_tickets", disposition: 'attachment'
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = the_tickets.find(params[:id])
    rescue
      redirect_to tickets_path, danger: "Ticket with ID##{params[:id]} not found"
    end

    def the_tickets
      current_user.tickets
    end

    # Only allow a trusted parameter "white list" through.
    def ticket_params
      params.require(:ticket).permit(:title, :description, :agent_id)
    end
end
