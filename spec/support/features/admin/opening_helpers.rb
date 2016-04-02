module Features
  module Admin
    module OpeningHelpers

      def fill_opening_details(opening)
        fill_in 'opening_title', with: opening.title
        fill_in 'opening_description', with: opening.description
        find(:checkbox, 'opening_current').set(opening.current?)
        find(:checkbox, 'opening_showcased').set(opening.showcased?)
      end

      def submit_opening(opening)
        fill_opening_details opening
        find('input[type="submit"]').click
      end

      def shown_opening
        id = find('.row-id td').text
        opening = Opening.find id
      end

    end
  end
end
