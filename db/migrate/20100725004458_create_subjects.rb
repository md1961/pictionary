class CreateSubjects < ActiveRecord::Migration
  def self.up
    create_table :subjects do |t|
      t.string  :name
      t.string  :name_zen
      t.string  :phonetic
      t.integer :category_id
      t.boolean :is_active  , :null => false, :default => true
      t.boolean :used       , :null => false, :default => false
    end
  end

  def self.down
    drop_table :subjects
  end
end
