# frozen_string_literal: true

# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  icon       :string           not null
#  name       :string           not null
#  type       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_categories_on_name  (name) UNIQUE
#
require "rails_helper"

RSpec.describe ItemCategory do
  subject { build(:item_category) }

  describe "associations" do
    it { is_expected.to have_many(:items).inverse_of(:category).dependent(:destroy) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_least(3).is_at_most(256) }
    it { is_expected.to validate_uniqueness_of(:name).case_insensitive }
  end
end
