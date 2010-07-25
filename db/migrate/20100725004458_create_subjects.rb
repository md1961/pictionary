class CreateSubjects < ActiveRecord::Migration
  def self.up
    create_table :subjects do |t|
      t.string :name
      t.string :name_zen
      t.string :phonetic
      t.string :category_id
    end
  end

  def self.down
    drop_table :subjects
  end
end
