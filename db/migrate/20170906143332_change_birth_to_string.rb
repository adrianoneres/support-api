class ChangeBirthToString < ActiveRecord::Migration[5.1]
  def change
    change_column :people, :birth, :string
  end
end
