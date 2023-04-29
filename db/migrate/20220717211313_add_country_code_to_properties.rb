class AddCountryCodeToProperties < ActiveRecord::Migration[7.0]
  def change
    add_column :properties, :country_code, :string
  end
end
