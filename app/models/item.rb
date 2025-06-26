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
class Item < ApplicationRecord

  # == Extensions ===========================================================
  enum :unit, {
    gram: 0,
    kilogram: 1,
    milliliter: 2,
    liter: 3,
    piece: 4,
    serving: 5
  }

  jsonb_accessor :nutrition,
                 calories: :integer,
                 protein: :float,
                 fat: :float,
                 carbohydrates: :float

  # == Constants ============================================================

  # == Attributes ===========================================================

  # == Relationships ========================================================
  belongs_to :category, class_name: "ItemCategory", inverse_of: :items

  # == Validations ==========================================================
  validates :name, :nutrition, :unit, presence: true
  validates :name, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 256 }

  # == Scopes ===============================================================

  # == Callbacks ============================================================

  # == Class Methods ========================================================

  # == Instance Methods =====================================================

end
