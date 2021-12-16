class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :user_id
      t.string :name
      t.string :category
      t.integer :price
      t.string :store
      t.float :evaluation, default:0
      t.text :body
      t.string :item_image_id

      t.timestamps
    end
  end
end
