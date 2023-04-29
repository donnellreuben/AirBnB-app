require "rails_helper"

RSpec.describe "Host::Dashboard", type: :request do
  let(:user) { create(:user, role: "host") }

  before { sign_in user }

  describe "GET index" do
    context "with valid role" do
      it "succeeds" do
        get host_dashboard_path
        expect(response).to be_successful
      end
    end

    context "without valid role" do
      it "fails" do
        user.update! role: nil
        expect {
          get host_dashboard_path
        }.to raise_exception(Pundit::NotAuthorizedError)
      end
    end
  end
end
