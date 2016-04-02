require 'rails_helper'
require 'support/matchers/have_node_with_content'

feature 'Home Page' do

  before(:all) do
    Setting['organization.name'] = @organization_name = 'Model Corporation'
    Setting['organization.description'] = @organization_description = 'Lorem ipsum dolor sit amet'
  end

  scenario 'Company information is presented' do
    visit root_path
    expect(page).to have_content @organization_name
    expect(page).to have_content @organization_description
  end

  scenario 'Openings are available' do

    @openings = {
      current: {
        showcased: create(:opening, :showcased),
        non_showcased: create(:opening)
      },
      expired: {
        showcased: create(:opening, :showcased, :expired),
        non_showcased: create(:opening, :expired)
      }
    }

    visit root_path

    opening = @openings[:current][:showcased]
    expect(page).to have_link opening.title, href: opening_path(opening)

    [
      [:current, :non_showcased],
      [:expired, :showcased],
      [:expired, :non_showcased]
    ].each do |(current_status, showcased_status)|
      opening = @openings[current_status][showcased_status]
      expect(page).to_not have_link opening.title, href: opening_path(opening)
    end

  end

  scenario 'No openings are available' do
    Opening.destroy_all
    visit root_path
    expect(find('.zilch-container')).to have_content 'There are no open positions right now'
  end

end
