class Bookfind::Scraper

  def self.getinfo
    booklist = Nokogiri::HTML(open("https://litreactor.com/columns/storyville-3-essential-books-you-should-read-in-every-major-genre/"))
    booklist.css("h2") do |bookinf|
      binding.pry
    end
  end
end
