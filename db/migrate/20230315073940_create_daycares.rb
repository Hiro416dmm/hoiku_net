class CreateDaycares < ActiveRecord::Migration[6.1]
  def change
    create_table :daycares do |t|
      t.string :daycare_name
      t.string :address
      t.string :phone
      t.string :pattern
      t.string :dayaweek
      t.string :weekday
      t.string :sat
      t.string :sun
      t.string :capacity
      t.string :short_time
      t.string :rate

      t.timestamps
    end
  end
end
