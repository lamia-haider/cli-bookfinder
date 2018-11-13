class Bookfind::CLI
  
  def call
    Bookfind::Scraper.getinfo
    puts "Hello human. I am the Scientific Anecdotes and Stories Suggester or SASS. Are you here to expand your small mamallian brain with fictional accounts of space, time travel and other such lofty concepts? Please just state 'yes' or 'no', we don't want to overcomplicate it for you."
    input = gets.strip
    if input == "yes"
      start 
      elsif input == "no" 
      puts "I see. Please come back when you are feeling more literate."
      else puts "I do not understand, please be more intelligible."
    end
  end

  
  def start
    puts "I suggest the following."
    bookcl = Bookfind::Books.all.sample
    puts "Why not try '#{bookcl.title}.'"
    puts "Interested? If you want more information type 'yes'. If you want a different recommendation type 'no'. Type 'exit' if you have decided that reading is too hard."
    input = gets.strip
    if input == "yes"
      puts "Author: #{bookcl.author}"
      puts "Website for more Information: #{bookcl.url}"
      puts "Synopsis: #{bookcl.summary}"
      puts "Date Published: #{bookcl.date}"
      puts "Website for more Information: #{bookcl.url}"
      elsif input == "no"
      start
      else puts "Are you actually typing or just smashing your face on the keyboard? Please try again."
    end
  end
end
 