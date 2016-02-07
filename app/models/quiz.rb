class Quiz < ActiveRecord::Base
end

# == Schema Information
#
# Table name: quizzes
#
#  id         :integer          not null, primary key
#  title      :string
#  creator_id :integer
#  duration   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
