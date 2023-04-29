class AddCountryCodeToProfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :country_code, :string
  end
end
