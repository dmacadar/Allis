class CreateAllisButtons < ActiveRecord::Migration
  def change
    create_table :allis_buttons do |t|
      t.references :user, index: true, foreign_key: true
      t.text :word
      t.datetime :start_date
      t.datetime :udate_date
      t.integer :interval
      t.text :subject_warning
      t.text :message_warning
      t.text :eml_warning
      t.integer :warns

      t.timestamps null: false
    end
  end
end
