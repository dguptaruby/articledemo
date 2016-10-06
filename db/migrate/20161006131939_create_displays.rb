class CreateDisplays < ActiveRecord::Migration[5.0]
  def change
    create_table :displays do |t|
      t.string :title
      t.string :body

      t.timestamps
    end
  end
end
