# Poke Tests – Technical Test

## Getting Started

Fork this repository to your own version control platform (e.g., GitHub, GitLab, Bitbucket).

Once you have completed the assignment, commit and push your changes.

## Objective

This test is designed to evaluate your ability to implement a clean architecture using dependency injection, MVVM pattern, and unit testing within a mobile application.

You will be working with a base project. It is intentionally incomplete and provided only as a starting point, you are free to modify or restructure it as you see fit.

Use the PokéAPI to retrieve Pokémon data: https://pokeapi.co

## Requirements

### General

Implement ViewModels and Services using dependency injection.

A basic custom DI implementation is included in the project, but feel free to use any DI framework you prefer.

### Features

1. List Screen

Fetch and display a list of Pokémon by name.

Optionally, enhance the list by showing more details (e.g., images).

Note: Displaying additional data may require extra API calls.
    
2. Detail Screen

When a Pokémon is selected from the list, navigate to a detail view showing:
- Name
- Image
- List of moves
- The UI/UX design of this screen is up to you.

### Testing

Write unit tests for your ViewModels and Services.

### Notes

Feel free to add any additional features or enhancements you think improve the application.

Preferences: Async/await/AsyncStream, Strict concurrency (Swift 6), Swift Testing
