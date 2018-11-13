class Bookfind::Books
  attr_accessor :title, :author, :date, :url, :summary
  @@all = []
  
  def self.getpage(book)
    titleau = book.text.split("by")
    title = titleau[0].strip
    author = titleau[1]
    url = "https://en.wikipedia.org/#{book.css("i a")[0]["href"]}"
   # url = book.css("head link.canonical").text
 #   url = "https://en.wikipedia.org/#{book.css("div.left-navigation div ul li span a").text}"
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
    odate.text = @page.css("tr td")[5]
    pdate = @page.css("tr td")[6]
    qdate = @page.css("tr td")[7]
    qdate = @page.css("tr td")[8]
    if odate =~ /[1850-2050]/
      @date = odate.text
      elsif pdate =~ /[1850-2050]/
      @date = pdate
      elsif qdate =~ /[1850-2050]/
      @date = qdate
      elsif rdate =~ /[1850-2050]/
      @date = rdate
      else puts "Unavailable"
    end
  end
  
  def summary
    @summary = @page.css("div.mw-parser-output p").text
  end
end

