class Bookfind::Books
  attr_accessor :title, :author, :date, :url, :summary
  @@all = []
  
  def self.getpage(book)
    titleau = book.text.split("by")
    title = titleau[0].strip
    author = titleau[1]
    #ubase = book.css("i a")#[0]["href"]
    url = "https://en.wikipedia.org/wiki/#{title.gsub(" ", "_")}"
    self.new(title, author, url)
    
 binding.pry
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
    getbook
    odate = @page.css("tr td")[5]
    pdate = @page.css("tr td")[6]
    qdate = @page.css("tr td")[7]
    rdate = @page.css("tr td")[8]
    if odate =~ /[1850-2050]/
      @date = odate.text
      elsif pdate =~ /[1850-2050]/
      @date = pdate.text
      elsif qdate =~ /[1850-2050]/
      @date = qdate.text
      elsif rdate =~ /[1850-2050]/
      @date = rdate.text
    end
  end
  
  def summary
    getbook
    @summary ||= @page.css("div.mw-parser-output p").text
  end
end

