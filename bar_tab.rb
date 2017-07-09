class BarTab
  attr_reader :guest_tabs
  def initialize
    @guest_tabs = {}
  end

  def add_to_customer_tab(guest, amount)   
    if @guest_tabs[guest] 
      @guest_tabs[guest] += amount
    else
      raise "No such customer in hash"
    end
  end

  #function which iterates through guest tabs
  def find_tab(guest_obj)
    tab_keys = @guest_tabs.keys
    guest = tab_keys.find{|guest_tab| guest_tab == guest_obj}
    return guest.nil? ? false : guest
  end

  def make_tab(guest_obj, amount)
    @guest_tabs[guest_obj] = amount 
  end






end