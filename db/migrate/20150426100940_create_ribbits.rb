class CreateRibbits < ActiveRecord::Migration
  def change
    create_table :ribbits do |t|
      t.text :context
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
