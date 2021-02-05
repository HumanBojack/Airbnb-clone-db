class CreateHouses < ActiveRecord::Migration[6.1]
  def change
    create_table :houses do |t|
    	t.integer :avaliable_beds
    	t.integer :price
    	t.text :description
    	t.boolean :has_wifi
    	t.belongs_to :city
    	t.text :welcome_message
    	t.references :admin, index:true

      t.timestamps
    end
  end
end
