require "nokogiri"
require "pry"
require "open-uri"
require "rake"

class Scraper
  
  @@all = []
  
  def self.getinfo
    
    booklist = Nokogiri::HTML(open("https://www.amazon.com/best-sellers-books-Amazon/zgbs/books/ref=zg_bs_unv_b_1_10134_2/136-1904286-8361318"))
    booklist.css("div.a-fixed-left-grid-inner ul ul li").each do |genre|
      genre.text.tr("\n","")
      binding.pry
    end


  end
end
  
#   def self.getgen
#     allgen = []
#     booklist.css(".zg_browseRoot"). each do |gen| allgen << gen.text.tr("\n\t", "")
#       binding.pry
#     end
#   end
# end
  
  # def getgenre
  #   self.getinfo.css("h2")
  # end
  
  # def makegenre
  #   getgenre.each do |gen|
  #     binding.pry 
  #   end
  # end
