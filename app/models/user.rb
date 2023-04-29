class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile, dependent: :destroy

  has_many :favorites, dependent: :destroy
  has_many :favorited_properties, through: :favorites, source: :property
  has_many :reservations, dependent: :destroy
  has_many :payments, through: :reservations
  has_many :reserved_properties, through: :reservations, source: :property
  has_many :reviews, dependent: :destroy
  has_many :properties, dependent: :destroy
  has_many :receiving_payments, through: :properties, source: :payments

  ROLES = %w[host]

  validates :role, inclusion: { in: ROLES }, allow_nil: true

  after_create :create_profile
  def create_profile
    self.profile = Profile.new
    save!
  end

  delegate :full_name, to: :profile

  def host?
    role == "host"
  end

  def hostify!
    update!(role: "host")
  end

  def customer?
    role.blank?
  end
end
