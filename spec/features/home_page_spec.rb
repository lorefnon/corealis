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

  context 'Openings are available' do
    before(:all) do
      @current_openings = 10.times.map { create(:opening) }
      @expired_openings = 10.times.map { create(:opening, :expired) }
      @showcased_openings = 10.times.map { create(:opening, :showcased) }
    end
    scenario 'Showcased openings are presented' do
      visit root_path
      @showcased_openings.each {|opening| expect(page).to have_content opening.title }
    end
  end

  context 'No openings are available' do
    before(:all) do
      Opening.destroy_all
    end
    scenario 'Information about absence of openings is presented' do
      visit root_path
      expect(find('.zilch-container')).to have_content 'There are no open positions right now'
    end
  end

end
