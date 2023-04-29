class Profile < ApplicationRecord
  include Countriable

  belongs_to :user

  has_one_attached :picture

  geocoded_by :address
  after_validation :geocode, if: -> { latitude.blank? && longitude.blank? }

  def address
    [state, country_name].compact.join(', ')
  end

  def full_name
    "#{first_name} #{last_name}".squish
  end
end
