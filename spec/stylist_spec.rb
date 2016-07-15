require 'spec_helper'

describe 'Stylist' do

  describe '#init' do
    it 'should create a new stylist' do
      new_stylist = Stylist.new({name: 'Leela', rate: '14.50', id: nil})
      new_stylist.save()
      expect(Stylist.all()).to eq([new_stylist])
    end
  end

  describe '.find_by_id' do
    it 'should find a stylist by id' do
      new_stylist = Stylist.new({name: 'Leela', rate: '14.50', id: nil})
      new_stylist.save()
      expect(Stylist.find_by_id(new_stylist.id)).to eq(new_stylist)
    end
  end

  describe '#update' do
    it 'should find a stylist by id' do
      new_stylist = Stylist.new({name: 'Leela', rate: '14.50', id: nil})
      new_stylist.save()
      new_stylist.update({name: 'Lehla', rate: '15.50'})
      expect(Stylist.find_by_id(new_stylist.id).name()).to eq('Lehla')
    end
  end

  describe '#delete' do
    it 'should find a stylist by id' do
      new_stylist = Stylist.new({name: 'Leela', rate: '14.50', id: nil})
      new_stylist.save()
      new_stylist.delete()
      expect(Stylist.all()).to eq([])
    end
  end

end
