class Bookfind::Books
  attr_accessor :title, :author, :date, :url, :summary
  @@all = []
  
  def self.getinforoman
    booklist = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/List_of_science_fiction_novels"))
    booklist.css(".mw-parser-output ul li").each do |book|
      titleau = book.text.split("by")
      @title = titleau[0]
      @author = titleau[1]
      urlbase = book.css("a").attribute("href").text
      @url = "https://en.wikipedia.org" + urlbase
      title = @title
      author = @author
      url = @url
      Bookfind::Books.new(title, author, url)
      @indivpg = Nokogiri::HTML(open(url))
      @summary = @indivpg.css("div.mw-parser-output p").text
      @pubdate = @indivpg.css("div.mw-parser-output table tbody tr th div").text
      binding.pry
    end
  end
  


  
  def initialize(title, author, url)
    @title = title
    @url = url
    @author = author
    @@all << self
  end
  
  def self.all
    @@all
  end

  
  def indivpg
    @indivpg = Nokogiri::HTML(open(self.url))
  end
  
  def summary
    @summary = indivpg.css("div.mw-parser-output p").text

  end

end
