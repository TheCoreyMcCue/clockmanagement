class AddUserToBlogs < ActiveRecord::Migration[6.1]
  def change
    add_reference :blogs, :user, null: false, foreign_key: true
    add_foreign_key :blogs, :users
  end
end
