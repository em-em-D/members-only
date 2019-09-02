class AddRememberTokenToUsers < ActiveRecord::Migration[5.2]
  # frozen_string_literal: true
  def change
    add_column :users, :remember_token, :string
  end
end
