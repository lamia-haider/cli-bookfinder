class Bookfind::CLI

  def intro
    puts "Hello human. I am the Scientific Anecdotes and Stories Suggester or SASS.".yellow
    puts "Are you here to expand your small mamallian brain with fictional accounts of space, time travel and other such complex concepts?".yellow
    puts "Please just state 'yes' or 'no', we don't want you to strain yourself.".yellow
  end


  def call
    intro
    Bookfind::Scraper.getinfo
    puts "Would you like a random book recommendation?".yellow
    input = gets.strip
    if input == "yes"
      start
    elsif input == "no"
      puts "I see. Please come back when you are feeling more literate! Good-bye!".yellow
      exit
    else puts "Sorry, you seem to have momentarily forgotten how to type. Please try again".yellow
      call

    end
  end

  def start
    @bookcl = Bookfind::Books.all.sample

    @bookurl = @bookcl.url
    @page = Nokogiri::HTML(open(@bookurl))
    if @page.css.include?("div.mw-parser-output")
      bookcl = @bookcl
      suggestion(bookcl)
    end
  end

  def suggestion(bookcl)
    bookcl = @bookcl
    puts "Why not try".yellow
    puts "'#{bookcl.title}'"
    puts "Interested? If you want more information type 'yes'. If you want a different recommendation type 'no'. Type 'exit' if you have decided that reading is too hard.".yellow
    input = gets.strip
    if input == "no"
      start
    elsif input == "yes"
      puts " . . . . . .. . . . . .. . . . . .. . . . . .. . . . . .. . . . . ."
      puts "Author: #{bookcl.author}"
      puts " . . . . . .. . . . . .. . . . . .. . . . . .. . . . . .. . . . . ."
      puts "Date Published: #{bookcl.date}"
      puts " . . . . . ."
      puts "Synopsis: #{bookcl.summary[0..900]}..."
      puts " . . . . . .. . . . . .. . . . . .. . . . . .. . . . . .. . . . . ."
      puts "Please visit the provided URL if you'd like to read further."
      puts "Website for more Information: #{bookcl.url}"
      puts "★・・・・・・★・・・・・・★・・・・・・★"
      call
    else puts "Sorry, you seem to be communicating in typos. Please try again.".yellow
      call
    end
  end

end
