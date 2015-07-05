class CreateAllisButtonStyles < ActiveRecord::Migration
  def change
    create_table :allis_button_styles do |t|
      t.string :name
      t.string :color, limit: 7

      t.timestamps null: false
    end
  end
end
