class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :happiness
      t.integer :nausea
      t.integer :height
      t.integer :tickets
    end
  end
end
