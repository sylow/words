class CreateMeanings < ActiveRecord::Migration
  def self.up
    create_table :meanings do |t|
      t.integer :word_id
      t.string :text

      t.timestamps
    end
  end

  def self.down
    drop_table :meanings
  end
end
