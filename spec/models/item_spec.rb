# frozen_string_literal: true

# == Schema Information
#
# Table name: items
#
#  id          :bigint           not null, primary key
#  name        :string           not null
#  quantity    :float            default(0.0), not null
#  type        :string           not null
#  unit        :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint
#  user_id     :bigint
#
# Indexes
#
#  index_items_on_category_id  (category_id)
#  index_items_on_name         (name) UNIQUE
#  index_items_on_quantity     (quantity)
#  index_items_on_user_id      (user_id)
#
require "rails_helper"

RSpec.describe Item do
  subject { build(:item) }

  describe "associations" do
    it { is_expected.to belong_to(:category).inverse_of(:items) }
    it { is_expected.to belong_to(:user) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_least(3).is_at_most(256) }
    it { is_expected.to validate_presence_of(:unit) }
    it { is_expected.to validate_presence_of(:quantity) }
    it { is_expected.to validate_numericality_of(:quantity).is_greater_than_or_equal_to(0) }
  end
end
