require 'spec_helper'

describe 'Client' do

  describe '#init' do
    it 'should create a new client' do
      new_client = Client.new({stylist_id: nil, name: "Kbae", phone: "345-543-3456", id: nil})
      new_client.save()
      expect(Client.all()).to eq([new_client])
    end
  end

  describe '.find_by_id' do
    it 'should find a client by id' do
      new_client = Client.new({stylist_id: nil, name: "Kbae", phone: "345-543-3456", id: nil})
      new_client.save()
      expect(Client.find_by_id(new_client.id)).to eq(new_client)
    end
  end

  describe '#update' do
    it 'should find a client by id' do
      new_client = Client.new({stylist_id: nil, name: "Kbae", phone: "345-543-3456", id: nil})
      new_client.save()
      new_client.update({stylist_id: 3, name: "Lee", phone: "345-543-3456"})
      expect(Client.find_by_id(new_client.id).stylist_id()).to eq(3)
    end
  end

  describe '#delete' do
    it 'should find a client by id' do
      new_client = Client.new({stylist_id: nil, name: "Kbae", phone: "345-543-3456", id: nil})
      new_client.save()
      new_client.delete()
      expect(Client.all()).to eq([])
    end
  end

end
