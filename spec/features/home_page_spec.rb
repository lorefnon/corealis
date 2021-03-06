require 'rails_helper'
require 'support/matchers/have_node_with_content'
require 'support/features/opening_helpers'

feature 'Home Page' do

  include Features::OpeningHelpers

  before(:all) do
    Setting['organization.name'] = @organization_name = 'Model Corporation'
    Setting['organization.description'] = @organization_description = 'Lorem ipsum dolor sit amet'
  end

  scenario 'User visits home page' do
    visit root_url
    expect(page).to have_content @organization_name
    expect(page).to have_content @organization_description
  end

  context 'Openings are available' do
    scenario 'User browses openings on home page' do
      openings = create_openings_of_all_variants
      visit root_url
      openings.each do |(current_status, showcased_status), opening|
        if current_status == :current && showcased_status == :showcased
          expect(page).to have_link opening.title, href: opening_path(opening)
        else
          expect(page).to_not have_link opening.title, href: opening_path(opening)
        end
      end
      expect(page).to have_link 'View All', href: openings_path
    end
  end

  context 'No openings are available' do
    scenario 'User browses openings on home page' do
      Opening.destroy_all
      visit root_url
      expect(find('.zilch-container')).to have_content 'There are no open positions right now'
    end
  end

end
