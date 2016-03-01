FactoryGirl.define do
  factory :question do
    sequence(:title) {|i| "question#{i}" }
    sequence(:description) {|i| "description#{i}" }
    creator
  end
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
