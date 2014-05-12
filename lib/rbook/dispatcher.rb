class Dispatcher

  attr_accessor :search, :cli

  def initialize(cli)
    self.search = PhonebookModel.new
    self.cli = cli
  end

  def dispatch(action)
    callback = "_callback_#{action}"
    if action.length > 0 and self.respond_to?(callback)
      self.method(callback).call
    end
    self.cli.action?
  end

  def _callback_quit
    puts "Thank you for using phonebook.app!"
    exit
  end

  def _callback_search
    print 'Type a name or phone number: '
    string = gets.chomp
    found = self.search.everywhere_for(string)
    if found.count > 0
      puts found
    else
      puts "No results found for #{string}"
    end
  end

  def _callback_version
    puts "Current Rbook App version is %s" % Rbook::VERSION
  end

end
