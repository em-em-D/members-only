class CreateUsers < ActiveRecord::Migration[5.2]
  # frozen_string_literal: true
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :user_token

      t.timestamps
    end
  end
end
