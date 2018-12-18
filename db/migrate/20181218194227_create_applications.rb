class CreateApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :applications do |t|
      t.references :vacancy, foreign_key: true
      t.references :candidate, foreign_key: true

      t.timestamps
    end
  end
end
