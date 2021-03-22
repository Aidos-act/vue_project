class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title, Null: false, Default: ""
      t.string :body, Null: false, Default: ""

      t.timestamps
    end
  end
end
