class Bookfind::CLI

  def call
    puts "Hello human. I am the Scientific Anecdotes and Stories System or SASS. Are you here to expand your small mamallian brain with fictional accounts of space, time travel and other such lofty concepts? Please just state 'yes' or 'no', we don't want to overcomplicate it for you."
    input = gets.strip
    if input == "yes"
      start 
      elsif input == "no" 
      puts "I see. Please come back when you are feeling more literate."
      else puts "I do not understand, please be more intelligible."
    end
  end
  
  def start
    puts "Excellent. Would you like a book that is short and will not cause you to strain yourself, or something more long-winded? Be advised, we are not responsible if you injure yourself while attempting to pronounce big words. Please type 'short' or 'long'."
    input = gets.strip
    if input == "short"
      shortlist
      elsif input == "long"
        longlist
      else puts "Are you actually typing or just smashing your face on the keyboard? Please try again."
    end
  end
  
  def shortlist
  end
    
end
