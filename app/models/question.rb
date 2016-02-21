class Question < ActiveRecord::Base

  has_paper_trail
  extend FriendlyId

  belongs_to :creator, class_name: 'AdminUser'
  has_many :answers

  validates :title, presence: true
  friendly_id :title, use: :slugged

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
