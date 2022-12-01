class CreateTimeLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :time_logs do |t|
      t.integer :worker_id
      t.datetime :start_time
      t.datetime :end_time
      t.decimal :total_time

      t.timestamps
    end
  end
end
