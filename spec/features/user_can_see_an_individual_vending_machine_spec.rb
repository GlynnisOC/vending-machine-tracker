require 'rails_helper'

RSpec.describe 'When a user visits a vending machine show page', type: :feature do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end

  scenario "they can see the name and price of snacks" do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    mnms = dons.snacks.create(name: "M&M's", cost: "$1.50")
    snickers = dons.snacks.create(name: "Snicker's", cost: "$2.00")
    nut_roll = dons.snacks.create(name: "Nut Roll", cost: "$1.25")

    visit machine_path(dons)

    expect(page).to have_content("M&M's")
    expect(page).to have_content("Snicker's")
    expect(page).to have_content("$1.50")
    expect(page).to have_content("$2.00")
  end

  scenario "they can see an average price for all snacks" do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    mnms = dons.snacks.create(name: "M&M's", cost: "$1.50")
    snickers = dons.snacks.create(name: "Snicker's", cost: "$2.00")
    nut_roll = dons.snacks.create(name: "Nut Roll", cost: "$1.25")

    visit machine_path(dons)

    expect(page).to have_content("$1.58")
    expect(page).to have_content("Average Price")
    expect(page).to have_content("Snicker's")
  end
end
