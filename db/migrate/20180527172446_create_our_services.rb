class CreateOurServices < ActiveRecord::Migration[5.2]
  def change
    create_table :our_services do |t|

      t.timestamps
    end
  end
end
