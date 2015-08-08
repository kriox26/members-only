class AddMemberToStories < ActiveRecord::Migration
  def change
    add_reference :stories, :member, index: true, foreign_key: true
  end
end
