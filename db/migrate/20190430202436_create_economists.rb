
class CreateEconomists < ActiveRecord::Migration[5.1]
  def change
    create_table :economists do |t|
      t.string :name
      t.integer :age
      t.string :city
      t.string :img_url

      t.timestamp
    end
  end
end
