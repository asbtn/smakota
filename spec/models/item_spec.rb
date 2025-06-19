# frozen_string_literal: true

# == Schema Information
#
# Table name: items
#
#  id          :bigint           not null, primary key
#  name        :string           not null
#  nutrition   :jsonb            not null
#  unit        :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer          not null
#
# Indexes
#
#  index_items_on_name  (name) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#
require "rails_helper"

RSpec.describe Item do
  subject { build(:item) }

  describe "associations" do
    it { is_expected.to belong_to(:category).inverse_of(:items) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_least(3).is_at_most(256) }
    it { is_expected.to validate_presence_of(:nutrition) }
    it { is_expected.to validate_presence_of(:unit) }
  end
end
