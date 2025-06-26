# frozen_string_literal: true

ActiveRecord::Base.transaction do # rubocop:disable Metrics/BlockLength
  unless User.exists?(email_address: "test@example.com")
    User.create!(email_address: "test@example.com", password: "Password123!",
                 name: "Test User")
  end

  # Create default categories
  categories = [
    { name: "Фрукти", type: "ItemCategory" },
    { name: "Овочі", type: "ItemCategory" },
    { name: "Молочні продукти", type: "ItemCategory" },
    { name: "М'ясо", type: "ItemCategory" },
    { name: "Зернові", type: "ItemCategory" },
    { name: "Напої", type: "ItemCategory" },
    { name: "Хлібобулочні вироби", type: "ItemCategory" },
    { name: "Солодощі", type: "ItemCategory" },
    { name: "Заморожені продукти", type: "ItemCategory" },
    { name: "Спеції та приправи", type: "ItemCategory" },
    { name: "Консервовані продукти", type: "ItemCategory" }
  ]

  categories.each do |category|
    Category.find_or_create_by!(name: category[:name], type: category[:type])
  end

  items = {
    "Фрукти" => [
      { name: "Яблуко", unit: :kilogram, nutrition: { calories: 95, protein: 0.5, fat: 0.3, carbohydrates: 25 } },
      { name: "Банан", unit: :kilogram, nutrition: { calories: 89, protein: 1.1, fat: 0.3, carbohydrates: 23 } }
    ],
    "Овочі" => [
      { name: "Морква", unit: :kilogram, nutrition: { calories: 41, protein: 0.9, fat: 0.2, carbohydrates: 10 } },
      { name: "Броколі", unit: :kilogram, nutrition: { calories: 55, protein: 3.7, fat: 0.6, carbohydrates: 11 } }
    ],
    "Молочні продукти" => [
      { name: "Молоко", unit: :liter, nutrition: { calories: 103, protein: 8, fat: 2.4, carbohydrates: 12 } },
      { name: "Сир", unit: :kilogram, nutrition: { calories: 402, protein: 25, fat: 33, carbohydrates: 1.3 } }
    ],
    "М'ясо" => [
      { name: "Куряче філе", unit: :kilogram, nutrition: { calories: 239, protein: 27, fat: 14, carbohydrates: 0 } },
      { name: "Яловичина", unit: :kilogram, nutrition: { calories: 250, protein: 26, fat: 17, carbohydrates: 0 } }
    ],
    "Зернові" => [
      { name: "Рис", unit: :kilogram, nutrition: { calories: 130, protein: 2.7, fat: 0.3, carbohydrates: 28 } },
      { name: "Гречка", unit: :kilogram, nutrition: { calories: 92, protein: 3.4, fat: 0.6, carbohydrates: 19 } }
    ],
    "Хлібобулочні вироби" => [
      { name: "Хліб", unit: :kilogram, nutrition: { calories: 265, protein: 9, fat: 3.2, carbohydrates: 49 } },
      { name: "Булочка", unit: :piece, nutrition: { calories: 150, protein: 4, fat: 2, carbohydrates: 28 } }
    ],
    "Напої" => [
      { name: "Вода", unit: :liter, nutrition: { calories: 0, protein: 0, fat: 0, carbohydrates: 0 } },
      { name: "Сік", unit: :liter, nutrition: { calories: 45, protein: 0.7, fat: 0.2, carbohydrates: 10 } }
    ],
    "Солодощі" => [
      { name: "Шоколад", unit: :gram, nutrition: { calories: 200, protein: 2.5, fat: 12, carbohydrates: 24 } },
      { name: "Печиво", unit: :piece, nutrition: { calories: 50, protein: 0.5, fat: 2, carbohydrates: 8 } }
    ],
    "Заморожені продукти" => [
      { name: "Заморожені овочі", unit: :kilogram,
        nutrition: { calories: 50, protein: 2, fat: 0.5, carbohydrates: 10 } },
      { name: "Заморожена піца", unit: :piece, nutrition: { calories: 300, protein: 12, fat: 15, carbohydrates: 30 } }
    ],
    "Спеції та приправи" => [
      { name: "Сіль", unit: :gram, nutrition: { calories: 0, protein: 0, fat: 0, carbohydrates: 0 } },
      { name: "Перець", unit: :gram, nutrition: { calories: 0, protein: 0, fat: 0, carbohydrates: 0 } }
    ],
    "Консервовані продукти" => [
      { name: "Консервовані помідори", unit: :kilogram,
        nutrition: { calories: 18, protein: 0.9, fat: 0.2, carbohydrates: 4 } },
      { name: "Консервований тунець", unit: :kilogram,
        nutrition: { calories: 132, protein: 28, fat: 1, carbohydrates: 0 } }
    ]
  }

  items.each do |category_name, items_array|
    category = Category.find_by(name: category_name)
    items_array.each do |item|
      Item.find_or_create_by!(name: item[:name]) do |i|
        i.unit = item[:unit]
        i.nutrition = item[:nutrition]
        i.category = category
      end
    end
  end
end
