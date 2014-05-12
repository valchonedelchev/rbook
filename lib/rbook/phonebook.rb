class Phonebook

  attr_accessor :dispatcher

  def initialize
    self.dispatcher = Dispatcher.new(self)
  end

  def action?
    action = prompt("Type search, version or quit:")
    self.dispatcher.dispatch(action)
  end

  def prompt(message="rbk> ")
    print "#{message} "
    gets.chomp
  end
end
