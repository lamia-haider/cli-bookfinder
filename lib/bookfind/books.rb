class Bookfind::Books
  attr_accessor :title, :author, :date, :url, :summary
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
  

  
  def shortlist
    @@short = self.all.delete_if {|short| short.pagenum > 350}
  
  end
  
  
  def getbook
    @page = Nokogiri::HTML(open(url))
  end
  
  def date
    pdate = @page.css("tr td")[6].text
    if pdate =~ /[1850-2050]/
      @date = pdate
      
    end
  end
  

  
  def summary
    @summary = @page.css("div.mw-parser-output p").text
  end
end

