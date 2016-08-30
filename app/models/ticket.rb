class Ticket < ApplicationRecord
  include AASM

  belongs_to :agent
  belongs_to :customer

  has_many :comments

  scope :unresolved, -> { where("tickets.aasm_state != 'resolved'") }
  scope :closed_in_last_month, -> { where(["tickets.updated_at > ?", 1.month.ago]) }

  validates :title, :description, presence: true

  ## State trasitions using Acts As State Machine
  aasm do
    state :unassigned, initial: true
    state :queued
    state :processing
    state :on_hold
    state :resolved

    event :assign do
      transitions :from => :unassigned, :to => :queued
    end

    event :hold do
      transitions :from => [:queued, :processing], :to => :on_hold
    end

    event :process do
      transitions :from => :queued, :to => :processing
    end

    event :reprocess do
      transitions :from => :on_hold, :to => :processing
    end

    event :resolve do
      transitions :from => :processing, :to => :resolved
    end
  end

  ## Give a list of valid events for State of a Ticket
  def valid_next_events
    aasm.events.map(&:name)
  end

  ## Check if the given even is one of the valid transitions
  def valid_next_event?(event)
    valid_next_events.include? event.to_sym
  end

  ## Assign the ticket to the laziest agent
  def assign_to_agent
    lazy_agent = Agent.lazy
    self.assign
    self.agent = lazy_agent
  end
end
