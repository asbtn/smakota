# frozen_string_literal: true

# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  type       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_categories_on_name  (name) UNIQUE
#
class Category < ApplicationRecord

  # == Extensions ===========================================================

  # == Constants ============================================================

  # == Attributes ===========================================================

  # == Relationships ========================================================

  # == Validations ==========================================================
  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 256 }

  # == Scopes ===============================================================

  # == Callbacks ============================================================

  # == Class Methods ========================================================

  # == Instance Methods =====================================================

end
