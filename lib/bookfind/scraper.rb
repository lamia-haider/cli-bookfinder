require "nokogiri"
require "pry"
require "open-uri"
require "rake"

class Scifibookfind::Scraper
  attr_accessor :title, :author, :date, :url, :summary


  def self.getinfo
    booklist = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/List_of_science_fiction_novels"))
    booklist.css(".mw-parser-output ul li").each do |obj|
      if obj.text.include?("by")
        Scifibookfind::Books.getpage(obj)
      end
    end
  end


  def self.getbook(url)
    page = Nokogiri::HTML(open(url))
    page
  end



end
