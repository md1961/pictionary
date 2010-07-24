class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.string :abbr
      t.string :name
      t.string :name_zen
      t.string :color
    end
  end

  def self.down
    drop_table :categories
  end
end
