class changeReplies < ActiveRecord::Migration[5.2]
  def change
    change_table :replies do |t|
      t.text :content
      t.integer :post_id

      t.timestamps
    end
  end
end
