class Article < ApplicationRecord

  after_create do
  	self.published_at = Time.now
  end

  before_save do
  	self.html = markdown_to_html(self.markdown)
  end

  validates :title, :author, :markdown, :html, presence: true
  acts_as_taggable_on :tags

  private
    def markdown_to_html(raw)
      markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
      markdown.render(raw)
    end
end
