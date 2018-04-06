class Activity

  attr_reader :name,
              :participants

  def initialize(name)
    @name = name
    @participants = {}
  end

  def add_participant(name, amount_paid)
    symbol_name = :"#{name}"
    participants.store(symbol_name, amount_paid)
  end

  def total_cost
    @participants.values.sum
  end

  def per_person_cost
    total_cost / @participants.keys.length
  end

  def owed
    owed = {}
    @participants.keys.each do |person|
      amount_paid = @participants.values_at(person)
      difference = per_person_cost - amount_paid[0]
      owed.store(person, difference)
    end
    owed
  end
end
