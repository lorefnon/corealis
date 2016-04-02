module Features
  module OpeningHelpers

    extend ActiveSupport::Concern

    def create_openings_of_all_variants
      {
        [:current, :showcased] => create(:opening, :showcased),
        [:current, :non_showcased] => create(:opening),
        [:expired, :showcased] => create(:opening, :showcased, :expired),
        [:expired, :non_showcased] => create(:opening, :expired)
      }
    end

  end
end
