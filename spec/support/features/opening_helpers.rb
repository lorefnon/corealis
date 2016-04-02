module Features
  module OpeningHelpers

    extend ActiveSupport::Concern

    def create_openings_of_all_variants
      {
        [:current, :showcased]      => FactoryGirl.create(:opening, :showcased),
        [:current, :non_showcased]  => FactoryGirl.create(:opening),
        [:expired, :showcased]      => FactoryGirl.create(:opening, :showcased, :expired),
        [:expired, :non_showcased]  => FactoryGirl.create(:opening, :expired)
      }
    end

    def visit_opening_from_home_page(opening)
      visit root_path
      click_on opening.title
      expect(current_path).to eq opening_path(opening)
      click_on 'Apply Now'
    end

  end
end
