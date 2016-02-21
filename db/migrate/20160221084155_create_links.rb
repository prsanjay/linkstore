class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :link_name
      t.string :subject
      t.text :description
      t.string :url
      t.text :url_content

      t.timestamps null: false
    end
  end
end
