class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :website

      t.timestamps
    end

    Company.create(name: 'default', website: 'www.default.com')
  end
end
