class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

        t.string :facebook_id, :name

      t.timestamps
    end
  end
end
