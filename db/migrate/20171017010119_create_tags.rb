class CreateTags < ActiveRecord::Migration
  def change
    create_table :prototypes_tags do |t|

      t.string :tag_id
      t.string :prototype_id
      t.timestamps
    end
  end
end
