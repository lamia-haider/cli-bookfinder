
class Scifibookfind::Books
  attr_accessor :title, :author, :date, :url, :summary

  @@all = []


  def self.getpage(obj)
    titleau = obj.text.split("by")
    title = titleau[0].strip
    author = titleau[1]
    if !obj.css('a').empty?
      url = "https://en.wikipedia.org/#{obj.css('a').attribute('href').value}"
    else url = "Unavailable"
    end
    self.new(title, author, url)

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

  def page
    @page = Scifibookfind::Scraper.getbook(@url)
  end

  def date
    fdate = @page.css('table.infobox tr td').detect{ |e| e.text =~ /\d{4}/ }
    if fdate == nil
      @date ="Unavailable"
    else @date = fdate
    end
  end


  def summary
    @summary ||= @page.css("div.mw-parser-output p").text
  end



end
