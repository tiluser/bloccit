class CreateAdvertisements < ActiveRecord::Migration[5.1]
  def change
    create_table :advertisements do |t|
      t.string :title
      t.text :body
      t.integer :price

      t.timestamps
    end
  end
end
