# frozen_string_literal: true

ActiveRecord::Base.transaction do # rubocop:disable Metrics/BlockLength
  unless User.exists?(email_address: "test@example.com")
    User.create!(email_address: "test@example.com", password: "Password123!",
                 name: "Test User")
  end

  categories_with_items = {
    { name: "Фрукти", icon: "🍎" } => [
      { name: "Яблуко", nutrition: { protein_g: 0.3, fat_g: 0.2, carbohydrates_g: 14, calories_kcal: 52 },
        unit: :gram },
      { name: "Банан", nutrition: { protein_g: 1.3, fat_g: 0.3, carbohydrates_g: 27, calories_kcal: 105 },
        unit: :gram },
      { name: "Апельсин", nutrition: { protein_g: 0.9, fat_g: 0.1, carbohydrates_g: 12, calories_kcal: 47 },
        unit: :gram },
      { name: "Груша", nutrition: { protein_g: 0.4, fat_g: 0.1, carbohydrates_g: 15, calories_kcal: 57 }, unit: :gram },
      { name: "Виноград", nutrition: { protein_g:  0.6, fat_g: 0.4, carbohydrates_g: 18, calories_kcal: 69 },
        unit: :gram },
      { name: "Полуниця", nutrition: { protein_g:  0.7, fat_g: 0.3, carbohydrates_g: 8, calories_kcal: 32 },
        unit: :gram },
      { name: "Черешня", nutrition: { protein_g: 1, fat_g: 0.3, carbohydrates_g: 16, calories_kcal: 63 },
        unit: :gram },
      { name: "Лимон", nutrition: { protein_g: 1.1, fat_g: 0.3, carbohydrates_g: 9, calories_kcal: 29 }, unit: :gram },
      { name: "Ківі", nutrition: { protein_g: 1.1, fat_g: 0.5, carbohydrates_g: 15, calories_kcal: 61 }, unit: :gram },
      { name: "Ананас", nutrition: { protein_g: 0.5, fat_g: 0.1, carbohydrates_g: 13, calories_kcal: 50 },
        unit: :gram }
    ],

    { name: "Овочі", icon: "🥦" } => [
      { name: "Морква", nutrition: { protein_g: 0.9, fat_g: 0.2, carbohydrates_g: 10, calories_kcal: 41 },
        unit: :gram },
      { name: "Картопля", nutrition: { protein_g: 2, fat_g: 0.1, carbohydrates_g: 17, calories_kcal: 77 },
        unit: :gram },
      { name: "Помідор", nutrition: { protein_g: 0.9, fat_g: 0.2, carbohydrates_g: 4, calories_kcal: 18 },
        unit: :gram },
      { name: "Огірок", nutrition: { protein_g:  0.7, fat_g: 0.1, carbohydrates_g: 3.6, calories_kcal: 16 },
        unit: :gram },
      { name: "Цибуля", nutrition: { protein_g:  1.1, fat_g: 0.1, carbohydrates_g: 9, calories_kcal: 40 },
        unit: :gram },
      { name: "Броколі", nutrition: { protein_g: 2.8, fat_g: 0.4, carbohydrates_g: 7, calories_kcal: 34 },
        unit: :gram },
      { name: "Часник", nutrition: { protein_g: 6.4, fat_g: 0.5, carbohydrates_g: 33, calories_kcal: 149 },
        unit: :gram },
      { name: "Перець солодкий", nutrition: { protein_g: 1, fat_g: 0.3, carbohydrates_g: 6, calories_kcal: 24 },
        unit: :gram },
      { name: "Капуста білокачанна", nutrition: { protein_g: 1.3, fat_g: 0.1, carbohydrates_g: 6, calories_kcal: 25 },
        unit: :gram },
      { name: "Селера", nutrition: { protein_g: 0.7, fat_g: 0.2, carbohydrates_g: 3, calories_kcal: 16 }, unit: :gram }
    ],

    { name: "Молочні продукти", icon: "🥛" } => [
      { name: "Молоко коров’яче", nutrition: { protein_g: 3.4, fat_g: 3.7, carbohydrates_g: 5, calories_kcal: 64 },
        unit: :milliliter },
      { name: "Йогурт натуральний", nutrition: { protein_g: 4.5, fat_g: 3.3, carbohydrates_g: 4.7, calories_kcal: 61 },
        unit: :gram },
      { name: "Сир твердий", nutrition: { protein_g: 25, fat_g: 33, carbohydrates_g: 1.3, calories_kcal: 402 },
        unit: :gram },
      { name: "Кефір", nutrition: { protein_g: 3.1, fat_g: 2.5, carbohydrates_g: 4, calories_kcal: 56 },
        unit: :milliliter },
      { name: "Сметана", nutrition: { protein_g: 2.9, fat_g: 20, carbohydrates_g: 3, calories_kcal: 206 },
        unit: :gram },
      { name: "Творог", nutrition: { protein_g: 18, fat_g: 10, carbohydrates_g: 3, calories_kcal: 170 }, unit: :gram }
    ],

    { name: "М'ясо", icon: "🍖" } => [
      { name: "Яловичина", nutrition: { protein_g: 26, fat_g: 15, carbohydrates_g: 0, calories_kcal: 250 },
        unit: :gram },
      { name: "Свинина", nutrition: { protein_g: 25, fat_g: 20, carbohydrates_g: 0, calories_kcal: 290 }, unit: :gram },
      { name: "Курка", nutrition: { protein_g: 27, fat_g: 3.6, carbohydrates_g: 0, calories_kcal: 165 }, unit: :gram },
      { name: "Індичка", nutrition: { protein_g: 29, fat_g: 7, carbohydrates_g: 0, calories_kcal: 189 }, unit: :gram },
      { name: "Ягнятина", nutrition: { protein_g: 25, fat_g: 20, carbohydrates_g: 0, calories_kcal: 294 },
        unit: :gram },
      { name: "Качка", nutrition: { protein_g: 19, fat_g: 28, carbohydrates_g: 0, calories_kcal: 337 }, unit: :gram }
    ],

    { name: "Зернові", icon: "🌾" } => [
      { name: "Рис", nutrition: { protein_g: 2.7, fat_g: 0.3, carbohydrates_g: 28, calories_kcal: 130 }, unit: :gram },
      { name: "Вівсянка", nutrition: { protein_g: 12, fat_g: 7, carbohydrates_g: 60, calories_kcal: 375 },
        unit: :gram },
      { name: "Пшениця", nutrition: { protein_g: 13, fat_g: 2.5, carbohydrates_g: 72, calories_kcal: 335 },
        unit: :gram },
      { name: "Гречка", nutrition: { protein_g: 13, fat_g: 3.4, carbohydrates_g: 71, calories_kcal: 343 },
        unit: :gram },
      { name: "Кукурудза", nutrition: { protein_g: 9, fat_g: 4.7, carbohydrates_g: 74, calories_kcal: 365 },
        unit: :gram },
      { name: "Жито", nutrition: { protein_g: 15, fat_g: 1.9, carbohydrates_g: 60, calories_kcal: 320 }, unit: :gram }
    ],

    { name: "Напої", icon: "🥤" } => [
      { name: "Вода", nutrition: { protein_g: 0, fat_g: 0, carbohydrates_g: 0, calories_kcal: 0 }, unit: :milliliter },
      { name: "Кава", nutrition: { protein_g: 0.1, fat_g: 0, carbohydrates_g: 0, calories_kcal: 2 },
        unit: :milliliter },
      { name: "Чай", nutrition: { protein_g: 0, fat_g: 0, carbohydrates_g: 0, calories_kcal: 1 }, unit: :milliliter },
      { name: "Сік апельсиновий", nutrition: { protein_g:  0.7, fat_g: 0.2, carbohydrates_g: 10, calories_kcal: 45 },
        unit: :milliliter },
      { name: "Молоко коров’яче", nutrition: { protein_g:  3.4, fat_g: 3.7, carbohydrates_g: 5, calories_kcal: 64 },
        unit: :milliliter }
    ],

    { name: "Хлібобулочні вироби", icon: "🥖" } => [
      { name: "Білий хліб", nutrition: { protein_g: 8, fat_g: 1, carbohydrates_g: 49, calories_kcal: 265 },
        unit: :gram },
      { name: "Чорний хліб", nutrition: { protein_g: 9, fat_g: 2, carbohydrates_g: 43, calories_kcal: 250 },
        unit: :gram },
      { name: "Булочка", nutrition: { protein_g: 7, fat_g: 4, carbohydrates_g: 45, calories_kcal: 280 }, unit: :piece },
      { name: "Багет", nutrition: { protein_g:  9, fat_g: 1, carbohydrates_g: 55, calories_kcal: 290 }, unit: :gram },
      { name: "Лаваш", nutrition: { protein_g:  7, fat_g: 1, carbohydrates_g: 60, calories_kcal: 270 }, unit: :gram }
    ],

    { name: "Солодощі", icon: "🍬" } => [
      { name: "Шоколад молочний", nutrition: { protein_g: 7.6, fat_g: 30, carbohydrates_g: 59, calories_kcal: 535 },
        unit: :gram },
      { name: "Цукерки", nutrition: { protein_g: 0, fat_g: 0, carbohydrates_g: 90, calories_kcal: 370 }, unit: :gram },
      { name: "Мед", nutrition: { protein_g: 0.3, fat_g: 0, carbohydrates_g: 82, calories_kcal: 304 }, unit: :gram },
      { name: "Печиво", nutrition: { protein_g: 6, fat_g: 18, carbohydrates_g: 65, calories_kcal: 450 }, unit: :gram }
    ],

    { name: "Заморожені продукти", icon: "❄️" } => [
      { name: "Заморожені овочі", nutrition: { protein_g: 2, fat_g: 0.5, carbohydrates_g: 8, calories_kcal: 50 },
        unit: :gram },
      { name: "Заморожена риба", nutrition: { protein_g: 20, fat_g: 5, carbohydrates_g: 0, calories_kcal: 150 },
        unit: :gram },
      { name: "Заморожені фрукти", nutrition: { protein_g: 1, fat_g: 0, carbohydrates_g: 10, calories_kcal: 40 },
        unit: :gram }
    ],

    { name: "Спеції та приправи", icon: "🧂" } => [
      { name: "Сіль", nutrition: { protein_g: 0, fat_g: 0, carbohydrates_g: 0, calories_kcal: 0 }, unit: :gram },
      { name: "Перець чорний", nutrition: { protein_g: 10, fat_g: 3, carbohydrates_g: 64, calories_kcal: 255 },
        unit: :gram },
      { name: "Паприка", nutrition: { protein_g:  14, fat_g: 13, carbohydrates_g: 55, calories_kcal: 282 },
        unit: :gram },
      { name: "Куркума", nutrition: { protein_g:  8, fat_g: 10, carbohydrates_g: 67, calories_kcal: 312 }, unit: :gram }
    ],

    { name: "Консервовані продукти", icon: "🥫" } => [
      { name: "Консервовані огірки", nutrition: { protein_g: 0.8, fat_g: 0, carbohydrates_g: 2.3, calories_kcal: 12 },
        unit: :gram },
      { name: "Консервована кукурудза", nutrition: { protein_g: 3.3, fat_g: 1.2, carbohydrates_g: 19, calories_kcal: 99 },
        unit: :gram },
      { name: "Консервовані помідори", nutrition: { protein_g: 1.1, fat_g: 0.2, carbohydrates_g: 4, calories_kcal: 21 },
        unit: :gram }
    ]
  }

  categories_with_items.each do |(category, items)|
    item_category = ItemCategory.find_or_initialize_by(name: category["name"])
    item_category.assign_attributes(category)
    item_category.save

    puts "Saved category: #{item_category.icon} #{item_category.name}!"

    items.each do |category_item|
      item = Item.find_or_initialize_by(name: category_item["name"])
      item.assign_attributes(category_item)
      item.category = item_category
      item.save

      puts "Saved item: #{item_category.icon} #{item.name}!"
    end
  end
end
