require "nokogiri"
require "pry"
require "open-uri"
require "rake"

class Bookfind::Scraper
  attr_accessor :title, :author, :date, :url, :summary
  @@all = []
  
  def self.getinforoman
    booklist = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/List_of_science_fiction_novels"))
    booklist.css(".mw-parser-output ul li").each do |book| 
      titleau = book.text.split("by")
      @title = titleau[0]
      @author = titleau[1]
      urlbase = book.css("a").attribute("href") 
      @url = "https://en.wikipedia.org/" + urlbase.text
      title = @title
      author = @author
      url = @url
      pubdate = @page.at('tr:contains("Publication date")').text.strip
      @page.css("tr td")[8].text.strip
   binding.pry
    end
 

   # Bookfind::Books.new(title, author)
  end
  
  def getpage
    @page = Nokogiri::HTML(open(url))
  end
  
  def summary
    @summary = @page.css("div.mw-parser-output p").text
    binding.pry
  end
    #  @pubdate = @indivpg.css("div.mw-parser-output table tbody tr th div").text
    



  
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
