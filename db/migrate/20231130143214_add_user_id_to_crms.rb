class AddUserIdToCrms < ActiveRecord::Migration[7.1]
  def change
    add_reference :crms, :user, null: false, foreign_key: true
  end
end
