class Bookfind::Books
  attr_accessor :title, :author, :date, :url, :summary
  @@all = []

  def initialize(title, author)
    @title = title
    @author = author
    urlbase = info.css("a.a-link-normal").attribute("href") # will need to prepend www.amazon.com
    @url = "www.amazon.com" + urlbase.to_s

    @@all << self
     binding.pry
  end

  
  def indivpg
    indivpg = Nokogiri::HTML(open(self.url))
  end
  
  def summary
    @summary = indivpg.css(".bookDescription_feature_div")
  
  end
  

    
  
end
