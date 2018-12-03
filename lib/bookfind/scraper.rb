require "nokogiri"
require "pry"
require "open-uri"
require "rake"

class Bookfind::Scraper
  attr_accessor :title, :author, :date, :url, :summary
  @@all = []

  def self.getinfo
    booklist = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/List_of_science_fiction_novels"))
    booklist.css(".mw-parser-output ul li").each do |obj|
      if obj.text.include?("by")
        Bookfind::Books.getpage(obj)
      end
      @@all<< obj
    end
  end

  def self.all
    @@all
  end

end
