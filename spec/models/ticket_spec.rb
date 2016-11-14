require 'rails_helper'

RSpec.describe Ticket, type: :model do
  let(:customer) { create :customer, email: 'cust@email.com' }
  let(:agent) { create :agent, email: 'agent@email.com' }
  let(:ticket) { create :ticket, customer: customer, agent: agent }

  ## Testing belongs_to associations
  it { expect(Ticket.reflect_on_association(:customer).macro).to  eq(:belongs_to) }
  it { expect(Ticket.reflect_on_association(:agent).macro).to  eq(:belongs_to) }
  it { expect(Ticket.reflect_on_association(:comments).macro).to  eq(:has_many) }

  context 'when new ticket' do
    it "should set 'unassigned' as the default state" do
      expect(Ticket.new.aasm_state).to eq('unassigned')
    end
  end

  describe "state transitions" do

    context "when valid transitions" do

      before do
        ticket.assign!
      end

      it "should allow state transition to 'queued' from 'unassigned'" do
        expect(ticket.aasm_state).to  eq('queued')
      end

      it "should allow state transition to 'processing' from 'queued" do
        expect(ticket.aasm_state).to  eq('queued')
        ticket.process!
        expect(ticket.aasm_state).to  eq('processing')
      end

      it "should allow state transition to 'on_hold' from 'queued" do
        expect(ticket.aasm_state).to  eq('queued')
        ticket.hold!
        expect(ticket.aasm_state).to  eq('on_hold')
      end

      it "should allow state transition from 'processing' to 'on_hold" do
        ticket.process!
        expect(ticket.aasm_state).to  eq('processing')
        ticket.hold!
        expect(ticket.aasm_state).to  eq('on_hold')
      end

      it "should allow state transition from 'on_hold' back to 'processing" do
        ticket.hold!
        expect(ticket.aasm_state).to  eq('on_hold')
        ticket.reprocess!
        expect(ticket.aasm_state).to  eq('processing')
      end

      it "should allow state transition from 'processing'  to 'on_hold" do
        ticket.process!
        expect(ticket.aasm_state).to  eq('processing')
        ticket.resolve!
        expect(ticket.aasm_state).to  eq('resolved')
      end
    end

    context "when invalid transitions" do
      it "should throw exception if state transitioned to 'processing' directly" do
        expect(ticket.aasm_state).to  eq('unassigned')
        expect { ticket.process! }.to  raise_error(AASM::InvalidTransition)
      end
    end
  end
end
