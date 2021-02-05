class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.belongs_to :house
      t.references :guest, index:true

      t.timestamps
    end
  end
end
