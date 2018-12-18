class CreateCandidates < ActiveRecord::Migration[5.2]
  def change
    create_table :candidates do |t|
      t.string :name, null:false
      t.string :profession, null:false
      t.string :location, null:false
      t.integer :level, null:false

      t.timestamps
    end
  end
end
