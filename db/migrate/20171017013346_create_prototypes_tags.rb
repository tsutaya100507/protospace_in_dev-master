class CreatePrototypesTags < ActiveRecord::Migration
  def change
    create_table :prototype_tags do |t|
      t.string :tag_id
      t.string :prototype_id

      t.timestamps null: false
    end
  end
end
