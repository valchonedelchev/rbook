class PhonebookModel

  attr_accessor :db, :sequel

  def initialize(db='etc/db.sqlite')
    self.db = db
    self.sequel = Sequel.sqlite(self.db)
  end

  def by_name(name="")
    return self.sequel.from(:contacts).grep(:name, "%#{name}%").to_a
  end

  def by_number(number="")
    return self.sequel.from(:contacts).grep(:number, "%#{number}%").to_a
  end

  def everywhere_for(string='')
    result = Array.new
    result.push(self.by_name(string))
    result.push(self.by_number(string))
    return result.uniq
  end

end
