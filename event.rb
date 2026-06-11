class Event
  attr_reader :type, :description, :duration, :timestamp

  def initialize(type, description, duration)
    @type = type
    @description = description
    @duration = duration
    @timestamp = Time.now
  end
end