class CreateHotels < ActiveRecord::Migration[5.0]
  def change
    create_table :hotels do |t|
      t.string :title
      t.string :created_by

      t.timestamps
    end
  end
end
