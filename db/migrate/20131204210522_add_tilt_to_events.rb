class AddTiltToEvents < ActiveRecord::Migration
  def up
    add_column :events, :tilt, :boolean
    add_column :events, :tilt_note, :string
    add_column :events, :people_min, :integer
  end
  def down
    remove_column :events, :tilt
    remove_column :events, :tilt_note
    remove_column :events, :people_min
  end
end
