class AddStripeIdToPayments < ActiveRecord::Migration[7.0]
  def change
    add_column :payments, :stripe_id, :string
  end
end
