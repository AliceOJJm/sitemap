class AddAncestryToPages < ActiveRecord::Migration[6.0]
  def change
    add_column :pages, :ancestry, :string
    add_index :pages, :ancestry
  end
end
