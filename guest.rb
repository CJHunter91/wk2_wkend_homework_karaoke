class Guest
  attr_reader :money
  def initialize(name)
    @name = name
    @money = 20
  end
end