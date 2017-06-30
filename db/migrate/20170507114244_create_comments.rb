class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :title
      t.belongs_to :user
      t.belongs_to :post
    end
  end
end
