class Scifibookfind::CLI

  def intro
    puts "Hello human. I am the Scientific Anecdotes and Stories Suggester Interface or SASSI.".yellow
    puts "Are you here to expand your small mamallian brain with fictional accounts of space, time travel and other such complex concepts?".yellow
    puts "Please just state 'yes' or 'no', we don't want you to strain yourself.".yellow
    call
  end


  def call
    Scifibookfind::Scraper.getinfo
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
    bookchosen = Scifibookfind::Books.all.sample
    Scifibookfind::Scraper.getbook(bookchosen)
    if bookchosen.summary
      suggestion(bookchosen)
    else
      start
    end
  end

  def suggestion(bookchosen)
    puts "Why not try".yellow
    puts "'#{bookchosen.title}'"
    puts "Interested? If you want more information type 'yes'. If you want a different recommendation type 'no'.".yellow
    puts "Type 'exit' if you have decided that reading is too hard.".yellow
    input = gets.strip
    if input == "no"
      start
    elsif input == "yes"
      puts " "
      puts "Author: #{bookchosen.author}"
      puts" "
      puts "Date Published: #{bookchosen.date}"
      puts " "
      puts "Synopsis: #{bookchosen.summary}..."
      puts " "
      puts " "
      puts " "
      puts "Please visit the provided URL if you'd like to read further."
      puts "Website for more Information: #{bookchosen.url}"
      puts "★・・・・・・★・・・・・・★・・・・・・★"
      call
    else puts "Sorry, you seem to be communicating in typos. Please try again.".yellow
      call
    end
  end

end
