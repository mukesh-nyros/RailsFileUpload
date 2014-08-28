class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :path

      t.timestamps
    end
  end
end
