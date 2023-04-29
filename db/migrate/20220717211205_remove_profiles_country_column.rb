class RemoveProfilesCountryColumn < ActiveRecord::Migration[7.0]
  def change
    remove_column :profiles, :country
  end
end
