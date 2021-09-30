# Contributing

- [Development Flow](#Development-Flow)
- [How to Contribute](#How-to-Contribute)
  - [Installation & Setup](#Installation-&-Setup)
    - [Quack App](#Quack-App)
	- [DCT Backend](#DCT-Backend)
	- [App Backend](#App-Backend)
- [Naming Conventions](#Naming-Conventions)
  - [Branch Naming](#Branch-Naming)
  - [Commit Style](#Commit-Style)
- [How to Code Review](#How-to-Code-Review)

## Development Flow

|--> Production (Most Stable Release)
  |--> Staging (Quality Assurance Testing)
    |--> Development (Feature Changes)
	  |--> Feature Branch (Unique Feature Change)

## How to Contribute

1. Create a new branch from `dev`, which can be done with the following command: `git checkout dev & git pull & git checkout -b NAME_YOUR_BRANCH`
2. Implement your changes and include the following:
  - Documentation
  - Unit Tests
3. Create a pull request that merges your branch into `dev`
4. Ensure all checks pass and then get 2 rounds of code review
5. Once your pull request is ready for merge, merge your branch! 
6. Delete your branch if it is no longer re-usable

### Installation & Setup

#### Quack App

1. Install the Flutter SDK
2. To run:
  1. First start the emulator of your choice (iOS or Android)
  2. `flutter run`
3. To test:
  1. `flutter test`
  2. To test and generate **ALL** golden files (don't do this unless everything changed!)
    `flutter test --generate-goldens`
  3. To test and generate **specific** golden files (new test or regen. a specific test)
    `flutter test --generate-goldens --name=<Name of Group or Test Description>`

#### DCT Backend

1. Install Python +3.8
2. Open a terminal in the DCT Backend directory
3. Install dependencies: `python3 -m pip install -r requirements.txt`
4. Start backend server: `uvicorn server:app`
5. To test endpoints: Use your browser or postman

#### App Backend

1. Install Python +3.8
2. Open a terminal in the DCT Backend directory
3. Install dependencies: `python3 -m pip install -r requirements.txt`
4. Start backend server: `uvicorn server:app`
5. To test endpoints: Use your browser or postman

## Naming Conventions

### Branch Naming

Use all lowercase names with "-" as spaces. The branch name should be short and sweet. Ex: `app-backend`

### Commit Style

Keep commit messages as appropriately short as possible. Use the imparitive mood and split changes with commas. Ex: `Add '/menu' route, Fix UI Bug`

## How to Code Review

1. Start your code review by clicking on `Files Changed` in the Pull Request View
2. Take a quick glimpse to see what the user files the user has changed
3. Review the Pull Request title, description, and commit messages to ensure the Pull Request implemented what it says it does
4. Throughly review the code to verify implementation does what it set out to do
  1. Remember to look for **unclear variable and method names**
  2. Remember to look for **documentation** for medium/large methods that describe the method and parameters
  3. Remember to look for **unreadable code**! The one liner solution isn't always the best!
  4. Remember to look for **hardcoded** variables! They should be abstracted as much as possible!
      This includes UI styling, sizes, colors, etc!
  5. Remember to look for thorough, passing unit tests! We don't want to test that X = X but that F(X) = Y for any known X
5. Leave comments that request changes and/or leave kuddos!
6. Don't forget to submit your review!
