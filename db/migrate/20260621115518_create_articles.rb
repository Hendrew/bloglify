class CreateArticles < ActiveRecord::Migration[8.1]
  def change
    create_table :articles, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.string  :title,   null: false
      t.string  :slug,    null: false
      t.text    :body,    null: false
      t.boolean :active,  null: false, default: false

      t.timestamps
    end

    add_index :articles, :title, unique: true
  end
end
