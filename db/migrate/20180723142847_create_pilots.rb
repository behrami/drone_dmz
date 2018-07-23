class CreatePilots < ActiveRecord::Migration[5.2]
  def change
    create_table :pilots do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.float :cost
      t.string :available_days
      t.text :summary
      t.string :country
      t.string :state
      t.string :city
      t.string :street
      t.string :postal_code

      t.timestamps
    end
  end
end
