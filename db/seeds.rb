# frozen_string_literal: true

ActiveRecord::Base.transaction do # rubocop:disable Metrics/BlockLength
  unless User.exists?(email_address: "test@example.com")
    User.create!(email_address: "test@example.com", password: "Password123!",
                 name: "Test User")
  end

  user = User.find_by(email_address: "test@example.com")

  categories_with_items = {
    { name: "Фрукти" } => [
      { name: "Яблуко", unit: :kilogram, quantity: Faker::Number.digit, user: },
      { name: "Банан", unit: :kilogram, quantity: Faker::Number.digit, user: },
      { name: "Апельсин", unit: :kilogram, quantity: Faker::Number.digit, user: },
      { name: "Груша", unit: :kilogram, quantity: Faker::Number.digit, user: },
      { name: "Виноград", unit: :kilogram, quantity: Faker::Number.digit, user: },
      { name: "Полуниця", unit: :kilogram, quantity: Faker::Number.digit, user: },
      { name: "Черешня", unit: :kilogram, quantity: Faker::Number.digit, user: },
      { name: "Лимон", unit: :kilogram, quantity: Faker::Number.digit, user: },
      { name: "Ківі", unit: :kilogram, quantity: Faker::Number.digit, user: },
      { name: "Ананас", unit: :kilogram }
    ],

    { name: "Овочі" } => [
      { name: "Морква", unit: :kilogram, quantity: Faker::Number.digit, user: },
      { name: "Картопля", unit: :kilogram, quantity: Faker::Number.digit, user: },
      { name: "Помідор", unit: :kilogram, quantity: Faker::Number.digit, user: },
      { name: "Огірок", unit: :kilogram, quantity: Faker::Number.digit, user: },
      { name: "Цибуля", unit: :kilogram, quantity: Faker::Number.digit, user: },
      { name: "Броколі", unit: :kilogram, quantity: Faker::Number.digit, user: },
      { name: "Часник", unit: :kilogram, quantity: Faker::Number.digit, user: },
      { name: "Перець солодкий", unit: :kilogram, quantity: Faker::Number.digit, user: },
      { name: "Капуста білокачанна", unit: :kilogram, quantity: Faker::Number.digit, user: },
      { name: "Селера", unit: :kilogram }
    ],

    { name: "Молочні продукти" } => [
      { name: "Молоко коров’яче", unit: :liter, quantity: Faker::Number.digit, user: },
      { name: "Йогурт натуральний", unit: :kilogram, quantity: Faker::Number.digit, user: },
      { name: "Сир твердий", unit: :kilogram, quantity: Faker::Number.digit, user: },
      { name: "Кефір", unit: :liter, quantity: Faker::Number.digit, user: },
      { name: "Сметана", unit: :kilogram, quantity: Faker::Number.digit, user: },
      { name: "Творог", unit: :kilogram }
    ],

    { name: "М'ясо" } => [
      { name: "Яловичина", unit: :kilogram, quantity: Faker::Number.digit, user: },
      { name: "Свинина", unit: :kilogram, quantity: Faker::Number.digit, user: },
      { name: "Курка", unit: :kilogram, quantity: Faker::Number.digit, user: },
      { name: "Індичка", unit: :kilogram, quantity: Faker::Number.digit, user: },
      { name: "Ягнятина", unit: :kilogram, quantity: Faker::Number.digit, user: },
      { name: "Качка", unit: :kilogram }
    ],

    { name: "Зернові" } => [
      { name: "Рис", unit: :kilogram, quantity: Faker::Number.digit, user: },
      { name: "Вівсянка", unit: :kilogram, quantity: Faker::Number.digit, user: },
      { name: "Пшениця", unit: :kilogram, quantity: Faker::Number.digit, user: },
      { name: "Гречка", unit: :kilogram, quantity: Faker::Number.digit, user: },
      { name: "Кукурудза", unit: :kilogram, quantity: Faker::Number.digit, user: },
      { name: "Жито", unit: :kilogram }
    ],

    { name: "Напої" } => [
      { name: "Вода", unit: :liter, quantity: Faker::Number.digit, user: },
      { name: "Кава", unit: :liter, quantity: Faker::Number.digit, user: },
      { name: "Чай", unit: :liter, quantity: Faker::Number.digit, user: },
      { name: "Сік апельсиновий", unit: :liter, quantity: Faker::Number.digit, user: },
      { name: "Молоко коров’яче", unit: :liter }
    ],

    { name: "Хлібобулочні вироби" } => [
      { name: "Білий хліб", unit: :kilogram, quantity: Faker::Number.digit, user: },
      { name: "Чорний хліб", unit: :kilogram, quantity: Faker::Number.digit, user: },
      { name: "Булочка", unit: :serving, quantity: Faker::Number.digit, user: },
      { name: "Багет", unit: :kilogram, quantity: Faker::Number.digit, user: },
      { name: "Лаваш", unit: :kilogram }
    ],

    { name: "Солодощі" } => [
      { name: "Шоколад молочний", unit: :kilogram, quantity: Faker::Number.digit, user: },
      { name: "Цукерки", unit: :kilogram, quantity: Faker::Number.digit, user: },
      { name: "Мед", unit: :kilogram, quantity: Faker::Number.digit, user: },
      { name: "Печиво", unit: :kilogram }
    ],

    { name: "Заморожені продукти" } => [
      { name: "Заморожені овочі", unit: :kilogram, quantity: Faker::Number.digit, user: },
      { name: "Заморожена риба", unit: :kilogram, quantity: Faker::Number.digit, user: },
      { name: "Заморожені фрукти", unit: :kilogram }
    ],

    { name: "Спеції та приправи" } => [
      { name: "Сіль", unit: :kilogram, quantity: Faker::Number.digit, user: },
      { name: "Перець чорний", unit: :kilogram, quantity: Faker::Number.digit, user: },
      { name: "Паприка", unit: :kilogram, quantity: Faker::Number.digit, user: },
      { name: "Куркума", unit: :kilogram }
    ],

    { name: "Консервовані продукти" } => [
      { name: "Консервовані огірки", unit: :kilogram, quantity: Faker::Number.digit, user: },
      { name: "Консервована кукурудза", unit: :kilogram, quantity: Faker::Number.digit, user: },
      { name: "Консервовані помідори", unit: :kilogram }
    ]
  }

  categories_with_items.each do |(category, items)|
    item_category = ItemCategory.find_or_initialize_by(name: category[:name])
    item_category.assign_attributes(category)
    item_category.save

    puts "Saved category: #{item_category} #{item_category.name}!"

    items.each do |category_item|
      item = PantryItem.find_or_initialize_by(name: category_item[:name])
      item.assign_attributes(category_item)
      item.category = item_category
      item.save

      puts "Saved item: #{item_category} #{item.name}!"
    end
  end
end
