class Stylist

  attr_accessor :name, :rate, :id

  def initialize(attr)
    @name = attr[:name]
    @rate = attr[:rate]
    @id = attr[:id]
  end

  def save
    returned_id = DB.exec("INSERT INTO stylists (name, rate) VALUES ('#{@name}', '#{@rate}') RETURNING id;")
    @id = returned_id.first['id'].to_i
  end

  def self.all()
    db_results = DB.exec("SELECT * FROM stylists")
    stylists = []
    db_results.each do |result|
      stylists.push( Stylist.new({ name: result['name'], rate: result['rate'], id: result['id'].to_i }))
    end
    stylists
  end

  def ==(other_stylist)
    self.id() == other_stylist.id() && self.name() == other_stylist.name()
  end


  def self.find_by_id(id)
    result = DB.exec("SELECT * FROM stylists WHERE id = #{id}").first
    Stylist.new({ name: result['name'], rate: result['rate'], id: result['id'].to_i }) || {rate: "NONE"}
  end

  def update(attr)
    attr.each do |col_name, value|
      if value.kind_of?(String)
        DB.exec("UPDATE stylists SET #{col_name} = '#{value}' WHERE id = #{@id};")
      else
        DB.exec("UPDATE stylists SET #{col_name} = #{value} WHERE id = #{@id};")
      end
    end
    result = DB.exec("SELECT * FROM stylists WHERE id = #{@id}").first
    Stylist.new({ name: result['name'], rate: result['rate'], id: result['id'].to_i })
  end

  def find_clients
    db_results =DB.exec("SELECT * FROM clients WHERE stylist_id = #{@id}");
    clients = []
    db_results.each do |result|
      clients.push( Client.new({ name: result['name'], phone: result['phone'], stylist_id: result['stylist_id'].to_i(), id: result['id'].to_i() }))
    end
    clients
  end

  def delete
    DB.exec("DELETE FROM stylists WHERE id = #{@id};")
  end

end
