
class Scifibookfind::Scraper

  def self.getinfo
    booklist = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/List_of_science_fiction_novels"))
    booklist.css(".mw-parser-output ul li").each do |obj|
      if obj.text.include?("by")
        titleau = obj.text.split("by")
        title = titleau[0].strip
        author = titleau[1]
        if !obj.css('a').empty?
          url = "https://en.wikipedia.org/#{obj.css('a').attribute('href').value}"
          Scifibookfind::Books.new(title, author, url)
        end
      end
    end
  end


  def self.getbook(bookchosen)
    page = Nokogiri::HTML(open(bookchosen.url))
    if page.at_css("div.mw-parser-output")
      bookchosen.date = page.css('table.infobox tr td').detect{ |e| e.text =~ /\d{4}/}.text
      bookchosen.summary = page.css("div.mw-parser-output p").text[0..1500]
    end
  end



end
