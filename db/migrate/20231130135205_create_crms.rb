class CreateCrms < ActiveRecord::Migration[7.1]
  def change
    create_table :crms do |t|
      t.string :title
      t.text :description
      t.decimal :price
      t.string :quantity

      t.timestamps
    end
  end
end
