class CreateWomen < ActiveRecord::Migration[5.2]
  def change
    create_table :women do |t|

      t.timestamps
    end
  end
end
