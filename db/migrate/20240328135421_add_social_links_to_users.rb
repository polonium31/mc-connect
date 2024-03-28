class AddSocialLinksToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :facebook_link, :string
    add_column :users, :github_link, :string
    add_column :users, :twitter_link, :string
  end
end
