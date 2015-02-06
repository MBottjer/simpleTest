class AddAveragePriceToDataPoints < ActiveRecord::Migration
  def change
    add_column :data_points, :averagePrice, :decimal
  end
end
