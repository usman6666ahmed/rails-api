class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts, id: :uuid do |t|
      t.string :title, null: false, default: "", limit: 50
      t.string :body, null: false, default: "", limit: 500
      t.string :user_id, null: false, foreign_key: true, index: true


      t.timestamps
    end
  end
end
