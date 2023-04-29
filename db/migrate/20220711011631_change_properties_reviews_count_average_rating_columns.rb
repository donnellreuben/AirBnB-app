class ChangePropertiesReviewsCountAverageRatingColumns < ActiveRecord::Migration[7.0]
  def change
    change_column :properties, :reviews_count, :integer, default: 0, null: false
    change_column :properties, :average_rating, :decimal, default: 0, null: false
  end
end
