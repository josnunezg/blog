class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :body
      t.belongs_to :post, null: false, foreign_key: true, index: true
      t.belongs_to :user, null: false, foreign_key: true, index: true
      t.datetime :deleted_at

      t.timestamps
    end

    add_index :comments, :deleted_at
  end
end
