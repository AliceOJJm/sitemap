class CreatePages < ActiveRecord::Migration[6.0]
  def change
    create_table :pages do |t|
      t.string :link_name
      t.string :path_name
      t.string :full_path
    end
  end
end
