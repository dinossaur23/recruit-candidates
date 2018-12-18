class ChangeApplicationsToCandidacies < ActiveRecord::Migration[5.2]
  def change
    rename_table :applications, :candidacies
  end
end
