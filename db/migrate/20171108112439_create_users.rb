class CreateUsers < ActiveRecord::Migration[5.1]
    def change
        if table_exists?("users")
            drop_table :users
        end
    
        create_table :users do |t|
            t.string :name
            t.string :email
            t.string :password_digest

            t.timestamps
        end
    end
end
