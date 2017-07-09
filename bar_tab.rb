class BarTab
  attr_reader :guest_tabs
  def initialize
    @guest_tabs = {}
  end

  def add_to_customer_tab(guest, amount)
   !@guest_tabs[guest] ? @guest_tabs[guest] = amount : @guest_tabs[guest] += amount 
  end

  #function which iterates through guest tabs
  def find_and_add_to_tab(guests, guest_name, amount)
    guest = guests.find{|guest_obj| guest_obj.name == guest_name}
    add_to_customer_tab(guest,amount)
    #if no customer potentially return false and ask if you want to create a tab
  end











end