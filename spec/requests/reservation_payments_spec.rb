require "rails_helper"

RSpec.describe "ReservationPayments", type: :request do
  let(:user) { create(:user, stripe_id: SecureRandom.uuid) }
  let(:property) { create(:property) }
  let(:payment_params) do
    {
      stripeToken: SecureRandom.uuid,
      property_id: property.id,
      user_id: user.id,
      checkin_date: "07/12/2022",
      checkout_date: "08/12/2022",
      subtotal: "100",
      cleaning_fee: "50",
      service_fee: "12.24",
      total: "162.24"
    }
  end

  before do
    sign_in user
    allow(Stripe::Customer).to receive(:retrieve).and_return(double(id: "user_id"))
    allow(Stripe::Customer).to receive(:create_source).and_return(double(id: "card_id"))
    allow(Stripe::Charge).to receive(:create).and_return(double(id: "charge_id"))
  end

  describe "POST create" do
    it "succeeds in creating a reservation" do
      expect {
        post reservation_payments_path, params: payment_params
      }.to change { Reservation.count }.by(1)
    end

    it "succeeds in creating a payment" do
      expect {
        post reservation_payments_path, params: payment_params
      }.to change { Payment.count }.by(1)
    end
  end
end
