class CreateWorkers < ActiveRecord::Migration[7.0]
  def change
    create_table :workers do |t|
      t.string :name
      t.timestamp :date_of_birth
      t.string :identifier

      t.timestamps
    end
  end
end
