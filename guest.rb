class Guest
  attr_reader :name, :favourite
  attr_accessor :money
  def initialize(name, favourite = "Dont stop believing")
    @name = name
    @money = 20
    @favourite = favourite
  end
end