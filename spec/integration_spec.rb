require 'spec_helper'


describe 'stylist resource', {type: :feature} do
  it 'should list all stylists on stylists route' do
    new_stylist = Stylist.new({name: 'Leela', rate: '14.50', id: nil})
    new_stylist.save()
    visit('/stylists')
    expect(page).to have_content 'Leela'
  end

  it 'should create a new stylist' do
    visit('/stylists')
    fill_in('name', with: 'Basque')
    fill_in('rate', with: '12.34')
    click_button('Add Stylist')
    expect(page).to have_content 'Basque'
  end

  it 'should show stylists rate when visiting stylist/:id' do
    new_stylist = Stylist.new({name: 'Leela', rate: '14.50', id: nil})
    new_stylist.save()
    visit('/stylists')
    click_link('Leela')
    expect(page).to have_content '14.50'
  end

  it 'should update a stylist' do
    new_stylist = Stylist.new({name: 'Leela', rate: '14.50', id: nil})
    new_stylist.save()
    visit('/stylists')
    click_link('Leela')
    fill_in('name', with: 'Basque')
    fill_in('rate', with: '12.34')
    click_button('Update Stylist')
    expect(page).to have_content '12.34'
  end

  it 'should delete a stylist' do
    new_stylist = Stylist.new({name: 'Leela', rate: '14.50', id: nil})
    new_stylist.save()
    visit('/stylists')
    click_link('Leela')
    click_button('Delete Stylist')
    expect(Stylist.all()).to eq([])
  end

  it 'should list all clients on stylist/:id' do
    new_stylist = Stylist.new({name: 'Leela', rate: '14.50', id: nil})
    new_stylist.save()
    new_client = Client.new({name: 'Chinzu', phone: '123-498-4322', id: nil, stylist_id: new_stylist.id()})
    new_client.save()
    visit('/stylists')
    click_link('Leela')
    expect(page).to have_content('Chinzu')
  end

end

describe 'Client resource', {type: :feature} do
  it 'should list all clients on clients route' do
    new_client = Client.new({name: 'Chinzu', phone: '123-498-4322', id: nil})
    new_client.save()
    visit('/clients')
    expect(page).to have_content 'Chinzu'
  end

  it 'should create a new client' do
    new_stylist = Stylist.new({name: 'Leela', rate: '14.50', id: nil})
    new_stylist.save()
    visit('/clients')
    fill_in('name', with: 'Basque')
    fill_in('phone', with: '122-333-4444')
    page.select('Leela', from: 'stylist_id')
    click_button('Add Client')
    expect(page).to have_content 'Basque'
  end

  it 'should show client phone when visiting client/:id' do
    new_client = Client.new({name: 'Chinzu', phone: '123-498-4322', id: nil})
    new_client.save()
    visit('/clients')
    click_link('Chinzu')
    expect(page).to have_content '123-498-4322'
  end

  it 'should update a client' do
    new_client = Client.new({name: 'Chinzu', phone: '123-498-4322', id: nil})
    new_client.save()
    visit('/clients')
    click_link('Chinzu')
    fill_in('name', with: 'Basque')
    fill_in('phone', with: '122-333-4444')
    click_button('Update Client')
    expect(page).to have_content '122-333-4444'
  end

  it 'should delete a client' do
    new_client = Client.new({name: 'Chinzu', phone: '123-498-4322', id: nil})
    new_client.save()
    visit('/clients')
    click_link('Chinzu')
    click_button('Delete Client')
    expect(Client.all()).to eq([])
  end

end
