require 'rails_helper'
require 'support/matchers/have_node_with_content'
require 'support/features/opening_helpers'

feature 'Home Page' do

  include Features::OpeningHelpers

  before(:all) do
    Setting['organization.name'] = @organization_name = 'Model Corporation'
    Setting['organization.description'] = @organization_description = 'Lorem ipsum dolor sit amet'
  end

  scenario 'home page is visited' do
    visit root_path
    expect(page).to have_content @organization_name
    expect(page).to have_content @organization_description
  end

  scenario 'Openings are available' do
    openings = create_openings_of_all_variants
    visit root_path
    openings.each do |(current_status, showcased_status), opening|
      if current_status == :current && showcased_status == :showcased
        expect(page).to have_link opening.title, href: opening_path(opening)
      else
        expect(page).to_not have_link opening.title, href: opening_path(opening)
      end
    end
  end

  scenario 'No openings are available' do
    Opening.destroy_all
    visit root_path
    expect(find('.zilch-container')).to have_content 'There are no open positions right now'
  end

end
