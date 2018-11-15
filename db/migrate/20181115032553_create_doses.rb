class CreateDoses < ActiveRecord::Migration[5.2]
  def change
    create_table :doses do |t|
      t.integer :amount
      t.text :description

      t.timestamps
    end
  end
end
