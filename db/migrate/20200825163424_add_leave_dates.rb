class AddLeaveDates < ActiveRecord::Migration[6.0]
  def change
    create_table :leave_dates do |t|
      t.date :date
      t.float :hours
      t.string :request_uid

      t.timestamps null: false
    end
  end
end
