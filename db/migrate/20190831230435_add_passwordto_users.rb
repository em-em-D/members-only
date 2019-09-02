class AddPasswordtoUsers < ActiveRecord::Migration[5.2]
  # frozen_string_literal: true
  def change
    add_column :users, :password_digest, :string
  end
end
