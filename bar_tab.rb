class BarTab
  attr_reader :guest_tabs
  def initialize
    @guest_tabs = {}
  end

  def add_to_customer_tab(guest, amount)
   !@guest_tabs[guest] ? @guest_tabs[guest] = amount : @guest_tabs[guest] += amount 
  end








end