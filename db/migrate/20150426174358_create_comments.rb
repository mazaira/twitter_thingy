class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :header
      t.string :body
      t.references :tweet, index: true

      t.timestamps null: false
    end
    add_foreign_key :comments, :tweets
  end
end
