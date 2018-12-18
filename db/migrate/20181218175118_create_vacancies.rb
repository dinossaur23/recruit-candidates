class CreateVacancies < ActiveRecord::Migration[5.2]
  def change
    create_table :vacancies do |t|
      t.string :company, null:false
      t.string :title, null:false
      t.string :description, null:false
      t.string :location, null:false
      t.integer :level, null:false

      t.timestamps
    end
  end
end
