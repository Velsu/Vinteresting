class CreateVins < ActiveRecord::Migration
  def change
    create_table :vins do |t|
      t.string :description

      t.timestamps
    end
  end
end
