require_relative "handler"

class StatsHandler < Handler
  def initialize
    @events = []
  end

  def handle(event)
    @events << event
  end

  def print_summary
    puts
    puts "===== Statistics Summary ====="

    if @events.empty?
      puts "No events recorded."
      return
    end

    grouped_events = @events.group_by(&:type)

    grouped_events.each do |type, events|
      puts "#{type}: #{events.count}"
    end

    total_minutes =
      @events.sum(&:duration)

    puts
    puts "Total Events: #{@events.count}"
    puts "Total Minutes: #{total_minutes}"
  end
end