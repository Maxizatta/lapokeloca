class CreateImgs < ActiveRecord::Migration[6.1]
  def change
    create_table :imagen do |t|
      t.string :imagen

      t.timestamps
    end
  end
end
