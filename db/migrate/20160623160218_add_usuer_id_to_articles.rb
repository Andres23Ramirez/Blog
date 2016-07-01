class AddUsuerIdToArticles < ActiveRecord::Migration
  def change
    add_reference :articles, :usuer, index: true, foreign_key: true
  end
end
