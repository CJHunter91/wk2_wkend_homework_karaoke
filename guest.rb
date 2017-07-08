class Guest
  attr_reader :name, :favourite
  attr_accessor :money
  def initialize(name, favourite = "Dont stop believing")
    @name = name
    @money = (5..40).to_a.sample
    @favourite = favourite
  end
end