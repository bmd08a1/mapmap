class AddLeaveDates < ActiveRecord::Migration[6.0]
  def change
    create_table :leave_dates do |t|
      t.string :date
      t.string :units
      t.string :request_uid

      t.timestamps null: false
    end
  end
end
