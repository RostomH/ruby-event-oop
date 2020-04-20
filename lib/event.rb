require 'pry'
require 'time'
class Event
  attr_accessor :start_date, :duration, :title, :attendees
  @@all_events = []

  def initialize(start_date_to_save, duration_to_save, title_to_save, attendees_to_save)
    @start_date = Time.parse("#{start_date_to_save}")
    @duration = duration_to_save.to_i
    @title = title_to_save.to_s
    @attendees = [attendees_to_save]
    @@all_events = @@all_events << self
  end

  def postpone_24h
    @start_date += 24*3600
  end

  def end_date
    @start_date + @duration * 60
  end

  def is_past?
    Time.now > @start_date
  end

  def is_future?
    !is_past?
  end

  def is_soon?
    @start_date - Time.now <= 3600
  end

  def to_s
    puts "Titre : #{@title}"
    puts "Date de début : #{@start_date}"
    puts "Durée : #{@duration} minutes"
    puts "Invités : #{@attendees.join(", ")}"
  end

  def self.all_events
    return @@all_events
  end

  binding.pry
  puts "end of file"  
end

