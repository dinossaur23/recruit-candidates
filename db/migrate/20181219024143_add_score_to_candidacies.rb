class AddScoreToCandidacies < ActiveRecord::Migration[5.2]
  def change
    add_column :candidacies, :score, :integer
  end
end
