class CreatePosts < ActiveRecord::Migration[5.2]
  # frozen_string_literal: true
  def change
    create_table :posts do |t|
      t.text :content
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
