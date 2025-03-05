# Смакота 🍲

Смакота is a web-first app designed to help you manage your pantry, plan meals, and create grocery lists.

With Смакота, you can:

- **Track pantry items** and build your own list of ingredients.
- **Generate grocery lists** that work seamlessly with your pantry and recipes.
- **Save your favorite recipes** and easily plan your meals.
- **Track leftovers** to make the most out of what you’ve already cooked.

## Features

- Customizable pantry inventory
- Recipe storage and meal planning
- Grocery list creation linked with pantry and recipes
- Leftover tracking to reduce waste
- Fully localized in Ukrainian 🇺🇦

## Tech Stack

- **Ruby on Rails 8** with Hotwire
- **Tailwind CSS**
- **PostgreSQL** for database management
- **Hotwire Native** for a mobile app experience (may consider Electron/Capacitor)

## Development Goals

- Focus on **experimenting with Rails 8**, including Hotwire and Tailwind
- Explore **Hotwire Native** for mobile app functionality
- Deepen my understanding of deployment by working with cloud hosting, Docker, and continuous deployment setups
- Challenge myself with designing a robust database structure, handling relationships between the pantry, grocery list, and recipes, and working towards building a reliable recipe parsing system

## Setup with Docker Compose

1. Clone the repository:
```bash
git clone git@github.com:asbtn/smakota.git
```
2. Build and start the Docker containers:
```bash
docker-compose up --build
```
