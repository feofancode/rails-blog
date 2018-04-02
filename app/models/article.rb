class Article < ApplicationRecord
  validates :title, :author, :markdown, :html, presence: true
  acts_as_taggable_on :tags
end
