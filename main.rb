require_relative "event"
require_relative "event_router"

require_relative "handlers/console_handler"
require_relative "handlers/file_handler"
require_relative "handlers/stats_handler"

router = EventRouter.new

console_handler = ConsoleHandler.new
file_handler = FileHandler.new
stats_handler = StatsHandler.new

router.register(console_handler)
router.register(file_handler)
router.register(stats_handler)

at_exit do
  stats_handler.print_summary
end

loop do
  puts
  puts "=== LifeTrack ==="
  puts "1. Log a work session"
  puts "2. Log a study session"
  puts "3. Log an exercise session"
  puts "4. Log a meal"
  puts "5. Exit"

  print "Choose an option: "

  choice = gets.chomp

  break if choice == "5"

  type =
    case choice
    when "1"
      "WORK"
    when "2"
      "STUDY"
    when "3"
      "EXERCISE"
    when "4"
      "MEAL"
    else
      puts "Invalid option."
      next
    end

  print "Description: "
  description = gets.chomp

  print "Duration (minutes): "
  duration = gets.to_i

  event = Event.new(
    type,
    description,
    duration
  )

  router.dispatch(event)
end