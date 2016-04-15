require 'rails_helper'

RSpec.describe Question, type: :model do
  it { is_expected.to belong_to :creator }
  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :creator_id }
end

# == Schema Information
#
# Table name: questions
#
#  id          :integer          not null, primary key
#  title       :string           not null
#  description :text
#  creator_id  :integer          not null
#  slug        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_questions_on_slug  (slug) UNIQUE
#
