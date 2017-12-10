class FixColumnName < ActiveRecord::Migration[5.1]
    def change
        if column_exists?(:posts, :rand)
            rename_column :posts, :rand, :rank
        end
    end
end
