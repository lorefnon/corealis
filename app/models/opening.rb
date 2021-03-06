class Opening < ApplicationRecord

  has_paper_trail

  scope :showcased, -> { where showcased: true }
  scope :current, -> { where current: true }

  slugify :title

  belongs_to :creator, class_name: 'AdminUser'
  has_many :application_submissions, dependent: :destroy
  has_many :applicants, through: :application_submissions

  validates :title, :creator_id, presence: true
  validates :creator, presence: true, on: :create
  validates :current, :showcased, inclusion: { in: [true, false] }

end

# == Schema Information
#
# Table name: openings
#
#  id          :integer          not null, primary key
#  title       :string           not null
#  slug        :string           not null
#  description :string
#  current     :boolean          default(TRUE), not null
#  showcased   :boolean          default(FALSE), not null
#  creator_id  :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
