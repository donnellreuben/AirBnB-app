require "rails_helper"

RSpec.describe "Payments", type: :request do
  let(:user) { create(:user) }
  let(:payments) { create_list(:payment, 3, user: user) }

  before { sign_in user }

  describe "GET index" do
    it "succeeds" do
      get payments_path
      expect(response).to be_successful
    end
  end
end
