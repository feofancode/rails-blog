class Admin::ArticlesController < ApplicationController
  layout 'admin'
  before_action :set_article, only: [:edit, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.order(published_at: :desc)
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)
    @article.published_at = Time.now
    @article.html = markdown_to_html(@article.markdown)

    respond_to do |format|
      if @article.save
        format.html { redirect_to admin_articles_url, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        if params[:article][:tags].nil?
          @article.tags.clear
          @article.save
        end
        format.html { redirect_to admin_articles_url, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to admin_articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :author, :markdown, tags_attributes: [:id, :name])
    end

    def markdown_to_html(raw)
      markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
      markdown.render(raw)
    end
end
