require 'rails_helper'

RSpec.describe Applicant, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

# == Schema Information
#
# Table name: applicants
#
#  id                  :integer          not null, primary key
#  creator_id          :integer
#  name                :string           not null
#  email               :string           not null
#  phone_number        :string
#  quiz_sessions_count :integer          default(0), not null
#  experience          :decimal(, )
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
# Indexes
#
#  index_applicants_on_creator_id    (creator_id)
#  index_applicants_on_email         (email) UNIQUE
#  index_applicants_on_experience    (experience)
#  index_applicants_on_phone_number  (phone_number)
#
