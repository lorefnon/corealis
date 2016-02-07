class Question < ActiveRecord::Base

  has_paper_trail

  belongs_to :creator, class_name: 'AdminUser'
  has_many :answers

  validates :title, presence: true

end

# == Schema Information
#
# Table name: questions
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  creator_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
