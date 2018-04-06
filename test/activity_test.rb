require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'
require 'pry'

class ActivityTest < Minitest::Test

  def test_activity_class_exists
    activity = Activity.new("hiking")

    assert_instance_of Activity, activity
  end

  def test_activitty_has_name
    activity = Activity.new("hiking")

    assert_equal "hiking", activity.name
  end

  def test_activity_can_have_participants
     activity = Activity.new("hiking")

     assert_instance_of Hash, activity.participants
     assert_equal ({}), activity.participants
  end

  def test_adding_participants
    activity = Activity.new("hiking")
    activity.add_participant("Mulder", 15)

    assert_equal ({:Mulder => 15}), activity.participants
    activity.add_participant("Scully", 5)
    assert_equal ({:Mulder => 15, :Scully => 5}), activity.participants
  end

  def test_activity_cost
    activity = Activity.new("hiking")
    activity.add_participant("CSM", 15)
    activity.add_participant("Dory", 5)

    assert_equal 20, activity.total_cost
  end

  def test_each_cost_can_be_split
    activity = Activity.new("biking")
    activity.add_participant("Wilma", 50)
    activity.add_participant("Fred", 5)
    activity.add_participant("Betty", 0)
    activity.add_participant("Barney", 5)

    assert_equal 15, activity.per_person_cost
  end

  def test_you_can_calculate_per_person_total
    activity_1 = Activity.new("donuts")
    activity_2 = Activity.new("BBQ")
    activity_1.add_participant("Arrieta", 50)
    activity_1.add_participant("Rizzo", 10)
    activity_2.add_participant("Dexter", 0)
    activity_2.add_participant("Rizzo", 50)
    activity_2.add_participant("Bryant", 25)

    assert_equal ({:Arrieta => -20, :Rizzo => 20}), activity_1.owed
    assert_equal ({:Dexter => 25, :Rizzo => -25, :Bryant => 0}),
    activity_2.owed
  end
end
