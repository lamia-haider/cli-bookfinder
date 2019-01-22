
class Scifibookfind::Books
  attr_accessor :title, :author, :date, :url, :summary

  @@all = []

  def initialize(title, author, url)
    @title = title
    @url = url
    @author = author
    @@all << self
  end

  def self.all
    @@all
  end



end
