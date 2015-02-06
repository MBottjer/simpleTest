class CreateDataPoints < ActiveRecord::Migration
  def change
    create_table :data_points do |t|
      t.decimal :time
      t.decimal :bid
      t.decimal :ask

      t.timestamps null: false
    end
  end
end
