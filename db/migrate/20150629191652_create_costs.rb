class CreateCosts < ActiveRecord::Migration
  def change
    create_table :costs do |t|
      t.string :item
      t.float :cost
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
