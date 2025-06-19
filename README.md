# Smakota/Смакота 🍲

Smakota is a web-first app designed to help you manage your pantry, plan meals, and create grocery lists, currently in development.

With Smakota, you can:

- **Track pantry items** and build your own list of ingredients.
- **Generate grocery lists** that work seamlessly with your pantry and recipes.
- **Save your favorite recipes** and easily plan your meals.
- **Track leftovers** to make the most out of what you’ve already cooked.

## Planned Features

- Fully localized in Ukrainian 🇺🇦

### In progress:
- Pantry inventory
- Grocery list creation linked with pantry
-
### To Do
- Recipe storage
- Meal planning
- Fully localize in English
-
### Maybe
- Leftover tracking to reduce waste

## Tech Stack

- **Ruby on Rails 8** with Hotwire
- **Tailwind CSS**
- **PostgreSQL** for database management
- **Hotwire Native** for a mobile app experience (may consider Electron/Capacitor)

### Notable gems and technologies

- `Phlex` for views and components

## Development Goals

- Focus on **experimenting with Rails 8**, including Hotwire and TailwindCSS
- Explore **Hotwire Native** for mobile app functionality
- Deepen my understanding of deployment by working with cloud hosting, Docker, and continuous deployment setups
- Challenge myself with designing a robust database structure, handling relationships between the pantry, grocery list, and recipes, and working towards building a reliable recipe parsing system
- Explore new gems and approaches (like using `Phlex` for components, or `dry` gems)

## Setup with Docker Compose

1. Clone the repository:
```bash
git clone git@github.com:asbtn/smakota.git
```
2. Build and start the Docker containers:
```bash
docker-compose up --build
```
