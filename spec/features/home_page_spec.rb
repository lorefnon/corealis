require 'rails_helper'
require 'support/matchers/have_node_with_content'

feature 'Home Page' do

  before(:all) do
    Setting['organization.name'] = @organization_name = 'Model Corporation'
    Setting['organization.description'] = @organization_description = 'Lorem ipsum dolor sit amet'
  end

  context 'Redirection rule is not specified' do
    scenario 'Company information is presented' do
      visit root_path
      expect(find_all('h1')).to have_node_with_content @organization_name
      expect(find_all('p')).to have_node_with_content @organization_description
    end
  end

end
