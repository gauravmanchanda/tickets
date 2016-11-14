require 'rails_helper'

RSpec.describe TicketsController, type: :controller do

  include Devise::Test::ControllerHelpers

  describe 'index' do

    let(:customer) { double(User, type: Customer) }
    let(:agent) { double(User, type: Agent) }
    let(:admin) { double(User, type: Admin) }
    let(:ticket) { double(Ticket) }
    let(:tickets) { [ticket] }

    context 'when user is not logged in' do

      it 'should redirect user to sign_in page' do
        get :index
        expect(response).to be_redirect
        expect(response).to redirect_to(new_user_session_path)
      end

    end

    describe "logged in" do

      context 'when Customer' do

        before do
          allow(customer).to receive(:authenticatable_salt).and_return(true)
          allow(customer).to receive(:to_key)
          sign_in customer, scope: :user
          allow(controller).to receive(:authenticate_user!).and_return(true)
          allow(controller).to receive(:current_user).and_return(customer)
          allow(customer).to receive(:tickets).and_return(tickets)
        end

        it "should display customer's tickets" do
          expect(customer).to receive(:tickets).and_return(tickets)
          get :index
        end
      end

      context 'when Agent' do

        before do
          allow(agent).to receive(:authenticatable_salt).and_return(true)
          allow(agent).to receive(:to_key)
          sign_in agent, scope: :user
          allow(controller).to receive(:authenticate_user!).and_return(true)
          allow(controller).to receive(:current_user).and_return(agent)
          allow(agent).to receive(:tickets).and_return(tickets)
        end

        it "should display agent's tickets" do
          expect(agent).to receive(:tickets).and_return(tickets)
          get :index
        end
      end

      context 'when Admin' do

        before do
          allow(agent).to receive(:authenticatable_salt).and_return(true)
          allow(agent).to receive(:to_key)
          sign_in agent, scope: :user
          allow(controller).to receive(:authenticate_user!).and_return(true)
          allow(controller).to receive(:current_user).and_return(agent)
          allow(agent).to receive(:tickets).and_return(tickets)
        end

        it "should display agent's tickets" do
          expect(agent).to receive(:tickets).and_return(tickets)
          get :index
        end

        it "should render the index template" do
          get :index
          expect(response).to be_success
          expect(response).to render_template('index')
        end
      end
    end
  end

end