class Bookfind::Books
  attr_accessor :title, :author, :date, :url, :summary
  @@all = []
  
  def self.var_from_main(info)
    urlbase = info.css("a.a-link-normal").attribute("href") # will need to prepend www.amazon.com
    title = info.css(".a-link-normal div").text.tr("\n", " ").strip
    url = "www.amazon.com" + urlbase.to_s
    author = info.css(".a-size-small span.a-color-base").text.tr("\n", " ").strip
    self.new(title, url, author)
  end
  
  def initialize(title, url, author)
    @title = title
    @url = url
    @author = author
    @@all << self
  end

  
  def indivpg
    @indivpg = Nokogiri::HTML(open(self.url))
  end
  
  def summary
    @summary = indivpg.css(".bookDescription_feature_div")
  end
  binding.pry
end
