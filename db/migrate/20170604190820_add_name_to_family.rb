class AddNameToFamily < ActiveRecord::Migration[5.0]
  def change
    add_column :families, :name, :string
  end
end
