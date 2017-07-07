class Guest
  attr_reader :name
  attr_accessor :money
  def initialize(name)
    @name = name
    @money = 20
  end
end