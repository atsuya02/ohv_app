# frozen_string_literal: true

class CreateInformation < ActiveRecord::Migration[6.1]
  def change
    create_table :information do |t|
      t.string :title, null: false
      t.string :picture, null: false
      t.date :announcement_date, null: false
      t.text :content, null: false
      t.integer :priority, null: false, default: 0

      t.timestamps
    end
  end
end
