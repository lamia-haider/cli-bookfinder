require 'net/http'



class Bookfind::Books
  attr_accessor :title, :author, :date, :url, :summary
  
  @@all = []
  
  
  
  # To-do: Exclude any books without the table.infobox.
  
  def self.getpage(book)
    titleau = book.text.split("by")
    title = titleau[0].strip
    author = titleau[1]
    url = "https://en.wikipedia.org/wiki/#{title.gsub(" ", "_")}"
    #rl = "https://en.wikipedia.org/#{book.css('i a').attr("href").text}"
    self.new(title, author, url)
    # checkurl
    # urlin
    # if urlin != "invalid" 
    #   url = @url
    #   binding.pry
    # end

    # if @page.at_css('div.mw-parser-output')
    #   url = @url
  end


  
  
  # def self.checkurl
  #   url = URI.parse(@url_str) rescue false
  #   url.kind_of?(URI::HTTP) || url.kind_of?(URI::HTTPS)
  # end
  
  # def self.urlin
  #   if checkurl == true
  #     @url = @url_str
  #     else "invalid"
  #   end
  # end
  
  def initialize(title, author, url)
    @title = title
    @url = url
    @author = author
    @@all << self
  end
  
  def self.all
    @@all
  end

    
  
  
  def getbook
    # response = open(@url) rescue nil
    # next unless response
    # @page = Nokogiri::HTML(response)
    @page = Nokogiri::HTML(open(@url))
    
    # if @page.at_css(div.mw-parser-output)
    #   @page
    # end
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
