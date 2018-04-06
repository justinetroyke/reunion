require 'activity'

class Reunion

  attr_reader :location,
              :activities

  def initialize(location)
    @location = location
    @activities = []
  end

  def <<(activity)
    activities << Activity.new(activity)
  end

  def list_activities
    @activities.map do |activity|
      activity.name
    end
  end

  def total_cost
    cost = []
    @activities.each do |activity|
      cost << activity.total_cost
    end
    cost.sum
  end

  # def amounts_owed
  #   number = @activities.length
  #   number.times do
  #     @activities.map do |activity|
  #       activity.owed
  #   end
  # end
end
