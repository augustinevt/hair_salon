class Client

  attr_accessor :name, :phone, :stylist_id, :id

  def initialize(attr)
    @name = attr[:name]
    @phone = attr[:phone]
    @stylist_id = attr[:stylist_id] || 0
    @id = attr[:id]
  end

  def save
    returned_id = DB.exec("INSERT INTO clients (name, phone, stylist_id) VALUES ('#{@name}', '#{@phone}', #{@stylist_id} ) RETURNING id;")
    @id = returned_id.first['id'].to_i
  end

  def self.all()
    db_results = DB.exec("SELECT * FROM clients")
    clients = []
    db_results.each do |result|
      clients.push( Client.new({ name: result['name'], phone: result['phone'], stylist_id: result['stylist_id'].to_i(), id: result['id'].to_i() }))
    end
    clients
  end

  def ==(other_client)
    self.id() == other_client.id() && self.name() == other_client.name()
  end

  def self.find_by_id(id)
    result = DB.exec("SELECT * FROM clients WHERE id = #{id}").first
    Client.new({ name: result['name'], phone: result['phone'], stylist_id: result['stylist_id'].to_i(), id: result['id'].to_i() })
  end

  def update(attr)
    attr.each do |col_name, value|
      if value.kind_of?(String)
        DB.exec("UPDATE clients SET #{col_name} = '#{value}' WHERE id = #{@id};")
      else
        DB.exec("UPDATE clients SET #{col_name} = #{value} WHERE id = #{@id};")
      end
    end
    result = DB.exec("SELECT * FROM clients WHERE id = #{id}").first
    Client.new({ name: result['name'], phone: result['phone'], stylist_id: result['stylist_id'].to_i(), id: result['id'].to_i() })
  end

  def delete
    DB.exec("DELETE FROM clients WHERE id = #{@id};")
  end

end
