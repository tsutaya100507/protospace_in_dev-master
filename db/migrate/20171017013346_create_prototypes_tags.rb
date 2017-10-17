class CreatePrototypesTags < ActiveRecord::Migration
  def change
    create_table :prototypes_tags do |t|

      t.timestamps null: false
    end
  end
end
