
class CreateEconomists < ActiveRecord::Migration[5.1]
  def change
    create_table :economists do |t|
      t.string :name
      t.string :age
      t.string :city

      t.timestamp
    end
  end
end
