# frozen_string_literal: true

# == Schema Information
#
# Table name: json_datasets
#
#  id         :bigint           not null, primary key
#  file       :binary
#  jsonb      :jsonb            not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  datum_id   :bigint
#
# Indexes
#
#  index_json_datasets_on_datum_id  (datum_id)
#
# Foreign Keys
#
#  fk_rails_...  (datum_id => data.id)
#
class JsonDataset < ApplicationRecord
  belongs_to :datum, touch: true
end
