require 'minitest'
require 'minitest/test'
require 'minitest/autorun'
require './lib/reunion'
require './lib/activity'

class ReunionTest < Minitest::Test

  def test_class_exists
    reunion = Reunion.new("Hoboken")

    assert_instance_of Reunion, reunion
  end

  def test_it_has_location
    reunion = Reunion.new("Piru")

    assert_equal "Piru", reunion.location
  end

  def test_it_has_activities
    reunion = Reunion.new("Chicago")

    assert_equal ([]), reunion.activities
  end

  def test_activities_can_be_added
    reunion = Reunion.new("Carpinteria")
    reunion << ("Hiking")
    reunion << ("Knockerball")

    assert_instance_of Array, reunion.activities
  end

  def test_it_can_list_activities
    reunion = Reunion.new("Carpinteria")
    reunion << ("Hiking")
    reunion << ("Knockerball")

    assert_equal ["Hiking", "Knockerball"], reunion.list_activities
  end

  def test_there_is_a_total_reunion_cost
    reunion = Reunion.new("Woodruff")
    reunion << ("Boating")
    reunion << ("Bingo")
    activity_1 = reunion.activities[0]
    activity_2 = reunion.activities[1]
    activity_1.add_participant("Freddie", 22)
    activity_1.add_participant("Jason", 40)
    activity_2.add_participant("Rose", 25)
    activity_2.add_participant("Rootbeer", 50)

    assert_equal 137, reunion.total_cost
  end

  def test_there_is_a_total_reunion_cost
    skip
    reunion = Reunion.new("Woodruff")
    reunion << ("Boating")
    reunion << ("Bingo")
    activity_1 = reunion.activities[0]
    activity_2 = reunion.activities[1]
    activity_1.add_participant("Freddie", 22)
    activity_1.add_participant("Jason", 40)
    activity_2.add_participant("Rose", 25)
    activity_2.add_participant("Rootbeer", 50)

    assert_equal ({:Freddie => 37.50, :Jason => -9, :Rose => 12.50, :Rootbeer => -12.50}),
     reunion.amounts_owed
  end
end
