class CreateChildren < ActiveRecord::Migration[5.0]
  def change
    create_table :children do |t|
      t.date :last_approval
      t.date :approved_thru
      t.date :last_denial
      t.date :last_submission
      t.text :notes
      t.integer :family_id
      t.integer :provider_id
      t.string :first_name
      t.string :last_name

      t.timestamps

    end
  end
end
