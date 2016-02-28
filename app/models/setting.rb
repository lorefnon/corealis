class Setting < ApplicationRecord

  has_paper_trail

  def self.[](key)
    where(key: key).first.try(:value)
  end

  def self.[]=(key, value)
    where(key: key)
      .first_or_initialize
      .tap{|it| it.value = value }
      .save!
  end

end

# == Schema Information
#
# Table name: settings
#
#  id         :integer          not null, primary key
#  key        :string           not null
#  value      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_settings_on_key  (key) UNIQUE
#
