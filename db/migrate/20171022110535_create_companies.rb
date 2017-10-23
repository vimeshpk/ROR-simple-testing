class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.text :address
      t.string :register_number
      t.timestamps
    end
  end
end
