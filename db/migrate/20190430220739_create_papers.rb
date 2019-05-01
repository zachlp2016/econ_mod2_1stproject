class CreatePapers < ActiveRecord::Migration[5.1]
  def change
    create_table :papers do |t|
      t.string :name
      t.integer :pages
      t.references :economist, foreign_key: true
    end
  end
end
