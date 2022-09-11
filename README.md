## About this Project

This project is a starting point for a Flutter application.

## Problem Solved
The project was written as a solution to the problem below
```
Requirement:
Develop a client example showcasing the use of RESTful APIs.
The example could be based on managing a user's data for example, and overall mobile
application design will not be assessed.

Back End:
Use an existing test source API that returns a JSON response.
Front End:
Mobile application based on the Flutter framework.

Key Assessment Areas:
1. Code structure, organization and documentation
2. Example thoroughness
3. Validation
4. Security Considerations
```

## Development Framework
The language used was Dart, through the Flutter framework, Other top libraries include
- providers, to manage state
- dio: to make API calls
- getx: for dependency injection
- get: miscellaneuos usage

## Development Requirements / Tools
Make sure you install [flutter_sdk] and [dart] installed on your system, this can be installed based on your operating system

## Running the Project
Open the command line and navigate to the folder you wish to create the project (please ensure you have git configured on your system)

clone the repo using the command below
```
git clone  [https://github.com/adelodundamilare/user_mgt_app]
```

Install project dependecies

```
flutter pub get
```
Start your emulator and run the app via VS Code or Android Studio

To complete the signup flow, you might be asked to enter a code you received on the phone number you registered with, something which may never come unless you're using a local number.

If you do not want to go through that stress, you can access the app using the details you'll find on the login screen

## Generate an APK
To generate an apk, run the following command
```
flutter build apk
```

Create an account, login, update profile and log out.

## App Features
- Create new user account
- Login
- Manage User Profile
- Log out
- Dark Mode Support
- TDD