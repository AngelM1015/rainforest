class CreateGears < ActiveRecord::Migration[5.2]
  def change
    create_table :gears do |t|

      t.timestamps
    end
  end
end
