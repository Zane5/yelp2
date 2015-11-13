class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :name
      t.text :description, :picture_url
      t.timestamps
    end
  end
end
