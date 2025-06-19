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
FactoryBot.define do
  factory :item do
    category factory: %i[item_category]

    unit { Item.units.values.sample }
    name { Faker::Food.ingredient }

    protein { Faker::Number.between(from: 1, to: 100) }
    fat { Faker::Number.between(from: 1, to: 100) }
    carbohydrates { Faker::Number.between(from: 1, to: 100) }
    calories { Faker::Number.between(from: 1, to: 100) }
  end
end
