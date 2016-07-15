class Stylist

  attr_accessor :name, :rate, :id

  def initialize(attr)
    @name = attr[:name]
    @rate = attr[:rate]
    @id = attr[:id]
  end

  def save
    returned_id = DB.exec("INSERT INTO stylists (name, rate) VALUES ('#{@name}', '#{@rate}') RETURNING id;")
    @id = returned_id.first['id']
  end

  def self.all()
    db_results = DB.exec("SELECT * FROM stylists")
    stylists = []
    db_results.each do |result|
      stylists.push( Stylist.new({ name: result['name'], rate: result['rate'], id: result['id'] }))
    end
    stylists
  end

  def ==(other_stylist)
    self.id() == other_stylist.id() && self.name() == other_stylist.name()
  end

end
