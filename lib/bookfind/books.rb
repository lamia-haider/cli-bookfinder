class Bookfind::Books
  attr_accessor :title, :author, :date, :url, :summary, :pagenum
  @@all = []
  
  def self.getpage(booklist)
    booklist.css(".mw-parser-output ul li").each do |book| 
      titleau = book.text.split("by")
      title = titleau[0].strip
      author = titleau[1]
      urlbase = book.at_css("a").attribute("href") 
      url = "https://en.wikipedia.org/" + urlbase.text
      self.new(title, author, url)
      binding.pry
    end
  end
  
  def initialize(title=nil, author=nil, url=nil)
    @title = title
    @url = url
    @author = author
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  
  def getbook
    @page = Nokogiri::HTML(open(url))
  end
  
  def date
    @date = @page.css("tr td")[7].text.strip
  end
  
  def pagenum
    @page.css("tr td")[9].text.strip
  end
  
  
  def summary
    @summary = @page.css("div.mw-parser-output p").text
  end
end

