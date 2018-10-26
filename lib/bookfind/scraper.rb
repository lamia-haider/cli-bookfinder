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
  
  
  def self.getinforoman
    booklist = Nokogiri::HTML(open("https://www.amazon.com/Best-Sellers-Books-Romance/zgbs/books/23/ref=zg_bs_nav_b_1_b"))
    booklist.css(".zg-item-immersion").each do |info|
      info.text.tr("\n","")
    end
  end
  
    
  def self.getinfoscifi
    allscifi = []
    booklist = Nokogiri::HTML(open("https://www.amazon.com/Best-Sellers-Books-Science-Fiction-Fantasy/zgbs/books/25/ref=zg_bs_nav_b_1_b"))
    booklist.css(".zg-item-immersion").each do |info| 
      title  = info.css(".a-link-normal div").text.tr("\n", " ").strip
      author = info.css(".a-size-small span.a-color-base").text.tr("\n", " ").strip
      urlbase = info.css("a.a-link-normal").attribute("href") # will need to prepend www.amazon.com
      url = "www.amazon.com" + urlbase.to_s
      Books.new(title, author, url)
      binding.pry
    end
  end
end
    # doc ||= Nokogiri::HTML(open(self.url))
    # date = doc.xpath(//*[@id="productDetailsTable"]/tbody/tr/td/div/ul/li[4]/text()).text
    # binding.pry 

