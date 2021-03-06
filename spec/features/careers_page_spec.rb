require 'rails_helper'
require 'support/matchers/have_node_with_content'
require 'support/features/opening_helpers'

feature 'Careers Page' do

  include Features::OpeningHelpers

  context 'Openings are available' do
    scenario 'User vists careers page' do
      openings = create_openings_of_all_variants
      visit openings_url
      openings.each do |(current_status, showcased_status), opening|
        if current_status == :current
          expect(page).to have_link opening.title, href: opening_path(opening)
        else
          expect(page).to_not have_link opening.title, href: opening_path(opening)
        end
      end
      expect(page).to_not have_link 'View All', href: openings_path
    end
  end

  context 'No openings are available' do
    scenario 'User visits careers page' do
      Opening.destroy_all
      visit openings_url
      expect(find('.zilch-container')).to have_content 'There are no open positions right now'
    end
  end

end
