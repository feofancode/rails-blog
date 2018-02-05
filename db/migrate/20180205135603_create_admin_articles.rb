class CreateAdminArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :admin_articles do |t|
      t.string :title
      t.string :author
      t.text :markdown
      t.text :html

      t.timestamps
    end
  end
end
