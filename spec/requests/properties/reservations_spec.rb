require "rails_helper"

RSpec.describe "Properties::Reservations", type: :request do
  let(:property) { create(:property) }
  let(:user) { create(:user) }

  before { sign_in user }

  describe "GET new" do
    it "succeeds" do
      get new_property_reservation_path(property), params: {
        checkin_date: "07/12/2022",
        checkout_date: "07/14/2022"
      }
    end
  end
end
