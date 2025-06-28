# == Schema Information
#
# Table name: pantry_items
#
#  id         :bigint           not null, primary key
#  quantity   :integer          default(0), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  item_id    :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_pantry_items_on_item_id   (item_id)
#  index_pantry_items_on_quantity  (quantity)
#  index_pantry_items_on_user_id   (user_id)
#
require "rails_helper"

RSpec.describe PantryItem, type: :model do
  describe "#associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:item) }
    it { is_expected.to have_one(:category).through(:item) }
  end

  describe "#validations" do
    it { is_expected.to validate_presence_of(:quantity) }
    it { is_expected.to validate_numericality_of(:quantity).is_greater_than_or_equal_to(0).only_integer }
  end

  describe "#delegations" do
    it { is_expected.to delegate_method(:name).to(:item) }
    it { is_expected.to delegate_method(:nutrition).to(:item) }
    it { is_expected.to delegate_method(:unit).to(:item) }
  end
end
