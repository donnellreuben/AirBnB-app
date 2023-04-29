require "rails_helper"

RSpec.describe User, type: :model do
  it { should have_one(:profile).dependent(:destroy) }
  it { should have_many(:favorites).dependent(:destroy) }
  it { should have_many(:favorited_properties).through(:favorites).source(:property) }
  it { should have_many(:reservations).dependent(:destroy) }
  it { should have_many(:payments).through(:reservations) }
  it { should have_many(:reserved_properties).through(:reservations).source(:property) }
  it { should have_many(:reviews).dependent(:destroy) }
  it { should have_many(:properties).dependent(:destroy) }
  it { should have_many(:receiving_payments).through(:properties).source(:payments) }
end
