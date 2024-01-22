# Employee Management App

## Overview

The Employee Management App is a Flutter application designed to help you manage your employees efficiently. It allows you to persist, update, store, and retrieve employee data using Flutter Hive, a lightweight and fast NoSQL database. The app includes a redesigned date picker, swipe-to-delete functionality, and error handling for cases like the joining date being after the leaving date.

## Features

- **Data Persistence:** The app uses Flutter Hive for efficient and reliable data storage. Employee data is persisted across app sessions.

- **Redesigned Date Picker:** The date picker has been enhanced for a better user experience.

- **Swipe-to-Delete:** Delete employees effortlessly by swiping left on their profiles.

- **Editing Employees:** Tap on an employee to edit their details directly within the app.

- **Error Handling:** The app handles common errors gracefully, such as cases where the joining date is after the leaving date.


## Walkthrough Video

Check out the [Walkthrough Video](videos/walkthrough.mp4) to see the app in action.

## Getting Started

To run the app on your local machine, follow these steps:

1. **Clone the repository:**

    ```bash
    git clone https://github.com/your-username/employee_management_app.git
    ```

2. **Navigate to the project directory:**

    ```bash
    cd employee_management_app
    ```

3. **Install dependencies:**

    ```bash
    flutter pub get
    ```

4. **Run the app:**

    ```bash
    flutter run
    ```

## Dependencies

- **bloc:** A predictable state management library that helps you manage the state of your application in a clear and scalable way.

- **hive:** A lightweight and fast NoSQL database for Flutter that provides efficient data persistence in your application.

- **flutter_bloc:** The Flutter implementation of the BLoC (Business Logic Component) pattern, used for managing state and logic in your application.

- **flutter_svg:** A Flutter package that allows you to easily display SVG (Scalable Vector Graphics) images in your application.

- **intl:** Provides internationalization and localization support for Flutter applications, allowing you to adapt your app to different languages and regions.

- **logger:** A simple logging package that provides customizable logging output for debugging and monitoring your Flutter application.

- **hive_flutter:** Flutter integration for the Hive database, enabling seamless interaction between Flutter and Hive for data storage.

- **equatable:** A Dart package that simplifies the equality testing of objects by automatically generating equality methods based on their fields.

- **table_calendar_null_safe:** A Flutter package that provides a customizable calendar widget for your app, allowing users to navigate and interact with dates easily.

