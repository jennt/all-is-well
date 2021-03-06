class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.belongs_to :client, index: true, foreign_key: true
      t.boolean :sharable, default: true
      t.boolean :read, default: false
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
