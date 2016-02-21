class Setting < ActiveRecord::Base
end

# == Schema Information
#
# Table name: settings
#
#  id         :integer          not null, primary key
#  key        :string
#  value      :jsonb
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
