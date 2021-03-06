class NewsController < ApplicationController
  def index
    @rss = "http://dev.openaustralia.org/news/index.rdf"
    @news_menu_on = true
    @months = News.all.map{|p| [p.timestamp.year, p.timestamp.month]}.uniq.map{|a| Date.new(a[0],a[1],1)}.sort.reverse

    if params[:year] && params[:month]
      date = Date.new(params[:year].to_i, params[:month].to_i, 1)
      @subtitle = date.to_s(:month)
      @extra_keywords = @subtitle
      @title = "#{@extra_keywords}: OpenAustralia news (OpenAustralia.org)"

      @posts = News.all.find_all {|p| params[:year] == p.year_param && params[:month] == p.month_param }.reverse
    else
      @extra_keywords = "OpenAustralia news"
      @title = "#{@extra_keywords} (OpenAustralia.org)"
      @subtitle = "&nbsp;"
    
      # Only show the first 10
      @posts = News.all[0..9]
    end
  end
  
  def show
    @rss = "http://dev.openaustralia.org/news/index.rdf"
    @news_menu_on = true
    posts = News.all
    @months = News.all.map{|p| [p.timestamp.year, p.timestamp.month]}.uniq.map{|a| Date.new(a[0],a[1],1)}.sort.reverse
    
    @post = posts.find {|p| params[:year] == p.year_param && params[:month] == p.month_param && params[:day] == p.day_param && params[:title] == p.title_param }
    @extra_keywords = @post.title
    @title = "#{@extra_keywords}: OpenAustralia news (OpenAustralia.org)"
  end  
end
