require "nokogiri"
require "pry"
require "open-uri"
require "rake"


class Scraper
  
  
  def self.getinfofic
    booklist = Nokogiri::HTML(open("https://www.amazon.com/Best-Sellers-Books-Literature-Fiction/zgbs/books/17/ref=zg_bs_nav_b_1_b"))
    booklist.css(".zg-item-immersion").each do |info|
      info.text.tr("\n","")
    end
  end

  
  def self.getinfomys
    booklist = Nokogiri::HTML(open("hhttps://www.amazon.com/Best-Sellers-Books-Mystery-Thriller-Suspense/zgbs/books/18/ref=zg_bs_nav_b_1_b"))
    booklist.css(".zg-item-immersion").each do |info|
      info.text.tr("\n","")
    end
  end
  
  @@all = []
  def self.getinforoman
    booklist = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/List_of_science_fiction_novels"))
    booklist.css(".mw-parser-output ul li").each do |book|
      titleau = book.text.split("by")
      @title = titleau[0]
      @author = titleau[1]
    
      # @author = book.css("a.authorName span").text
      # @grrating = book.css("span.minirating").text
      # @link= book.css("a.bookTitle")
      binding.pry
    end
 
  
    
  end


    
  def self.getinfoscifi
    allscifi = []
    booklist = Nokogiri::HTML(open("https://www.amazon.com/Best-Sellers-Books-Science-Fiction-Fantasy/zgbs/books/25/ref=zg_bs_nav_b_1_b"))
    booklist.css(".zg-item-immersion").each do |info| 
      title  = info.css(".a-link-normal div").text.tr("\n", " ").strip
      author = info.css(".a-size-small span.a-color-base").text.tr("\n", " ").strip
      urlbase = info.css("a.a-link-normal").attribute("href").text
      url = "http://www.amazon.com" + urlbase.to_s
      url1 = url.split("?")[0]
    #  Bookfind::Books.new(title, author)
  end
end
end
