class Bookfind::CLI

  def call
    Bookfind::Scraper.getinfo
    puts "Hello human. I am the Scientific Anecdotes and Stories Suggester or SASS. Are you here to expand your small mamallian brain with fictional accounts of space, time travel and other such lofty concepts? Please just state 'yes' or 'no', we don't want to overcomplicate it for you.".blue
    input = gets.strip
    if input == "yes"
      start 
      elsif input == "no" 
        puts "I see. Please come back when you are feeling more literate".blue
      else exit
    end
  end
  
  def start
    puts "I suggest the following.".blue
    @bookcl = Bookfind::Books.all.sample
    if checkfordiv == true
      bookcl = @bookcl
      puts "Why not try '#{bookcl.title}'".blue
      puts "Interested? If you want more information type 'yes'. If you want a different recommendation type 'no'. Type 'exit' if you have decided that reading is too hard.".blue
      input = gets.strip
      if input == "yes"
        puts "Author: #{bookcl.author}"
        puts "Date Published: #{bookcl.date}"
        puts "Synopsis: #{bookcl.summary[0..1000]}..."
        puts "Please visit the provided URL if you'd like to read further.".blue
        puts "Website for more Information: #{bookcl.url}"
        elsif input == "no"
        start
        else puts "Are you actually typing or just smashing your face on the keyboard? Please try again."
        end
      end
    end
  end
  def checkfordiv
    @page = Nokogiri::HTML(open(@bookcl.url))
    if @page.at_css("div.mw-parser-output") != nil
      true
    end
  end

