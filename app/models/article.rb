class Article < ApplicationRecord
  validates :title, :author, :markdown, :html, presence: true
  has_and_belongs_to_many :tags
  accepts_nested_attributes_for :tags
end
