# frozen_string_literal: true

# == Schema Information
#
# Table name: data
#
#  id         :integer          not null, primary key
#  mime       :string
#  date       :date
#  converted  :boolean
#  author     :string
#  source     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  pod_id     :integer
#


class Datum < ApplicationRecord
  belongs_to :pod
  has_one :json_dataset
end
