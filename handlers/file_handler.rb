require_relative "handler"

class FileHandler < Handler
  LOG_FILE = "events.log"

  def handle(event)
    File.open(LOG_FILE, "a") do |file|
      file.puts(
        "[#{event.timestamp.strftime("%Y-%m-%d %H:%M")}] #{event.type} - #{event.description} (#{event.duration} min)"
      )
    end
  end
end