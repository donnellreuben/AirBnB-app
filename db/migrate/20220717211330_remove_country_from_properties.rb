class RemoveCountryFromProperties < ActiveRecord::Migration[7.0]
  def change
    remove_column :properties, :country
  end
end
