class CreateZukans < ActiveRecord::Migration[7.1]
  def change
    create_table :zukans do |t|
      t.string :name

      t.timestamps
    end
  end
end
