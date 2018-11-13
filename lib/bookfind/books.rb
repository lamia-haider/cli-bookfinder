require 'net/http'



class Bookfind::Books
  attr_accessor :title, :author, :date, :url, :summary
  @@all = []
  
  
  
  # To-do: Exclude any books without the table.infobox.
  
  def self.getpage(book)
    titleau = book.text.split("by")
    title = titleau[0].strip
    author = titleau[1]
    #ubase = book.css("i a")#[0]["href"]
    if url != "invalid"
      self.new(title, author, url)
      binding.pry
      end
    end
  end
  
  def url_str
    url_str = "https://en.wikipedia.org/wiki/#{title.gsub(" ", "_")}"
  end
  
  def checkurl(url_str)
    url = URI.parse(url_str) rescue false
    url.kind_of?(URI::HTTP) || url.kind_of?(URI::HTTPS)
  end
  
  def url
    if checkurl == "true"
      url = url_str
    else "invalid"
    
  
  
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
    fdate = @page.css('table.infobox tr td').detect{ |e| e.text =~ /\d{4}/ }
    @date = fdate.text
    @date
    # odate = @page.css("tr td")[5]
    # pdate = @page.css("tr td")[6]
    # qdate = @page.css("tr td")[7]
    # rdate = @page.css("tr td")[8]
    # if odate =~ /[1850-2050]/
    #   @date = odate.text
    #   elsif pdate =~ /[1850-2050]/
    #   @date = pdate.text
    #   elsif qdate =~ /[1850-2050]/
    #   @date = qdate.text
    #   elsif rdate =~ /[1850-2050]/
    #   @date = rdate.text
    # # end            
  end

  
  def summary
    getbook
    @summary ||= @page.css("div.mw-parser-output p").text
  end
end

