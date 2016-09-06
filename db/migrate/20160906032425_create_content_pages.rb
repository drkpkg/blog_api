class CreateContentPages < ActiveRecord::Migration[5.0]
  def change
    create_table :content_pages do |t|
      t.string :url
      t.string :content

      t.timestamps
    end
  end
end
