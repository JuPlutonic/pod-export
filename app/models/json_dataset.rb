# frozen_string_literal: true

# == Schema Information
#
# Table name: json_datasets
#
#  id         :integer          not null, primary key
#  files      :binary           default("[]"), not null
#  jsonb      :jsonb            not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  datum_id   :integer
#

class JsonDataset < ApplicationRecord
  belongs_to :datum
end
