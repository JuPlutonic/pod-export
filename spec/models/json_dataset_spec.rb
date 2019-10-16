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

require 'rails_helper'

RSpec.describe JsonDataset, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
