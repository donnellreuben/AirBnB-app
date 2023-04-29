class Payment < ApplicationRecord
  belongs_to :reservation

  monetize :subtotal_cents, allow_nil: true
  monetize :cleaning_fee_cents, allow_nil: true
  monetize :service_fee_cents, allow_nil: true
  monetize :total_cents, allow_nil: true
end
