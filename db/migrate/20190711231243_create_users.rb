class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
        :username
        :first_name
        :last_name
        :password_digest
      t.timestamps
    end
  end
end
