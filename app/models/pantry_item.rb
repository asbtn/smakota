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
class PantryItem < Item

  # == Extensions ===========================================================

  # == Constants ============================================================

  # == Attributes ===========================================================

  # == Relationships ========================================================

  # == Validations ==========================================================

  # == Scopes ===============================================================

  # == Callbacks ============================================================

  # == Class Methods ========================================================

  # == Instance Methods =====================================================

end
