class CreateReplies < ActiveRecord::Migration[5.2]
  def change
    create_table :replies do |t|
      
      t.text :content
      t.integer :post_id
      
      t.timestamps null: false
    end
  end
end
