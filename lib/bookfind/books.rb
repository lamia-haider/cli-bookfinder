class Bookfind::Books
  attr_accessor :title, :author, :date, :url, :summary
  @@all = []
  
  def self.getpage(book)
    titleau = book.text.split("by")
    title = titleau[0].strip
    author = titleau[1]
    url = book.css("head link.canonical").text
    #url = "https://en.wikipedia.org/#{book.css("a").attribute("href").text}"
    self.new(title, author, url)
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
    @page = Nokogiri::HTML(open(self.url))
  end
  
  def date
    pdate = @page.css("tr td")[6].text
    qdate = @page.css("tr td")[7]
    if pdate =~ /[1850-2050]/
      @date = pdate
    elsif qdate =~ /[1850-2050]/
    @date = pdate
  else puts "Unavailable"
    end
  end


   
  

  
  def summary
    @summary = @page.css("div.mw-parser-output p").text
  end
end

