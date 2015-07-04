class AddStyleNameToAllisButtons < ActiveRecord::Migration
  def change
    add_column :allis_buttons, :style, :text
  end
end
