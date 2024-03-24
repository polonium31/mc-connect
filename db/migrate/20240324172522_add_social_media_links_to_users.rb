class AddSocialMediaLinksToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :instagram_link, :string
    add_column :users, :linkedin_link, :string
  end
end
