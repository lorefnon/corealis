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

  end
end
