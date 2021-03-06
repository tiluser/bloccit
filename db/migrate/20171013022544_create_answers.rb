class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
        if table_exists?("answers")
            drop_table :answers
        end

    
    create_table :answers do |t|
      t.text :body
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
