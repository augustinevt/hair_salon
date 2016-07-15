require 'spec_helper'

describe 'Stylist' do
  describe 'init' do
    it 'should create a new stylist' do
      new_stylist = Stylist.new({name: 'Leela', rate: "14.50", id: nil})
      new_stylist.save()
      expect(Stylist.all()).to eq([new_stylist])
    end
  end
end
