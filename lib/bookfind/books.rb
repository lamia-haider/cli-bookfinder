require 'net/http'



class Bookfind::Books
  attr_accessor :title, :author, :date, :url, :summary

  @@all = []


  def self.getpage(obj)
    titleau = obj.text.split("by")
    title = titleau[0].strip
    author = titleau[1]
  #  binding.pry
    # if title.scan(/\w+/).size == 1
    #   url = "https://en.wikipedia.org/wiki/#{title.gsub(" ", "_")}_(novel)"
    # else
    url = "https://en.wikipedia.org/wiki/#{title.gsub(" ", "_")}"
#    url = "https://en.wikipedia.org/#{obj.css('i a').attr("href").text}"
    @url_str = url
    checkurl
    urlin
    if urlin != "invalid"
      self.new(title, author, url)
    end
  end

  def self.checkurl
     url = URI.parse(@url_str) rescue false
     url.kind_of?(URI::HTTP) || url.kind_of?(URI::HTTPS)
   end

  def self.urlin
     if checkurl == true
       @url = @url_str
       else "invalid"
     end
   end

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
    if fdate = @page.css('table.infobox tr td').detect{ |e| e.text =~ /\d{4}/ }
      @date = fdate.text
    else @date ="Unavailable"
    end
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
