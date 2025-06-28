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
class PantryItem < ApplicationRecord

  # == Extensions ===========================================================

  # == Constants ============================================================

  # == Attributes ===========================================================

  # == Relationships ========================================================
  belongs_to :user
  belongs_to :item

  has_one :category, through: :item

  # == Validations ==========================================================
  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0, only_numeric: true }

  # == Scopes ===============================================================

  # == Callbacks ============================================================

  # == Class Methods ========================================================

  # == Instance Methods =====================================================
  delegate :name, :nutrition, :unit, to: :item

end
