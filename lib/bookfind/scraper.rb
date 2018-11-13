require "nokogiri"
require "pry"
require "open-uri"
require "rake"

class Bookfind::Scraper
  attr_accessor :title, :author, :date, :url, :summary
  @@all = []
  
  def self.getinfo
    booklist = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/List_of_science_fiction_novels"))
    booklist.css(".mw-parser-output ul li").each do |book| 
      if book.text.include?("by")
        @@all<< book.text
        Bookfind::Books.getpage(book)
      end
    end
  end
  
  def url
    urlbase = book.css("a").attribute("href") 
    @url = "https://en.wikipedia.org/" + urlbase.text
  end
 

  def getpage
    @page = Nokogiri::HTML(open(url))
  end
  
  def date
    @date = @page.css("tr td")[7].text.strip
  end
  
  def pagenum
    @page.css("tr td")[9].text.strip
  end
  
  def genre 
    @genre = @page.css("tr td")[5].text.strip
  end
  
  def summary
    @summary = @page.css("div.mw-parser-output p").text
  end
end


