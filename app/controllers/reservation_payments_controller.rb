# frozen_string_literal: true

class ReservationPaymentsController < ApplicationController
  before_action :authenticate_user!

  def create
    stripe_card = Stripe::Customer.create_source(
      stripe_customer.id,
      { source: payment_params[:stripeToken] }
    )
    charge = Stripe::Charge.create(
      amount: Money.from_amount(BigDecimal(payment_params[:total])).cents,
      currency: "usd",
      source: stripe_card.id,
      customer: stripe_customer.id
    )
    reservation = Reservation.create(
      property: property,
      user: user,
      checkin_date: Date.strptime(payment_params[:checkin_date], Date::DATE_FORMATS[:us_short_date]),
      checkout_date: Date.strptime(payment_params[:checkout_date], Date::DATE_FORMATS[:us_short_date])
    )
    payment = Payment.create(
      reservation: reservation,
      subtotal: Money.from_amount(BigDecimal(payment_params[:subtotal])),
      cleaning_fee: Money.from_amount(BigDecimal(payment_params[:cleaning_fee])),
      service_fee: Money.from_amount(BigDecimal(payment_params[:service_fee])),
      total: Money.from_amount(BigDecimal(payment_params[:total])),
      stripe_id: charge.id
    )

    redirect_to root_path
  end

  private

  def payment_params
    params.permit(:stripeToken, :property_id, :user_id, :checkin_date, :checkout_date,
                  :subtotal, :cleaning_fee, :service_fee, :total)
  end

  def user
    @user ||= User.find(payment_params[:user_id])
  end

  def property
    @property ||= Property.find(payment_params[:property_id])
  end

  def stripe_customer
    @stripe_customer ||= if user.stripe_id.blank?
                           customer = Stripe::Customer.create(email: user.email)
                           user.update(stripe_id: customer.id)
                           customer
                         else
                           Stripe::Customer.retrieve(user.stripe_id)
                         end
  end
end
