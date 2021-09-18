# Front-End File Descriptions
This repository contains the front-end code for the prototype version of Grove. It's built using Flutter, written in Dart.

To run this code:
1. You'll need to have Chrome installed to debug.
2. Install the [Flutter SDK](https://flutter.dev/docs/get-started/install)
3. Follow [these instructions](https://flutter.dev/docs/development/tools/vs-code) for Visual Studio, and [these](https://flutter.dev/docs/development/tools/android-studio) for IntelliJ
4. You'll then need to configure your SDK for web support, by following [this quick process](https://flutter.dev/docs/get-started/web#set-up).
5. Clone the repo, and you should be good to go!

For people who are already confident with other types of software development, Flutter has resources to help translate your skills. Here's an example one for [React Native](https://flutter.dev/docs/get-started/flutter-for/react-native-devs). You can see other ones by looking under the "From Another Platform?" dropdown on the left.

- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)
- [Flutter documentation](https://flutter.dev/docs)
- [Flutter tutorials](https://flutter.dev/docs/reference/tutorials)

Here's a description of the relevant files and folders. Everything else is mostly boilerplate generated by Flutter.

## pubspec.yaml

This file contains this project's dependencies. To use a public package (like those available on [pub.dev](https://pub.dev)), add `package_name: ^(version number)` under `dependencies`, then run `flutter pub get` (or just `Ctrl+S` in Visual Studio).

## /assets

This folder contains all globally-relevant images or videos, like logos and loader images. 

## /lib

This is where all the code to manipulate is. 

### /async

Home to a file that handles all asynchronous requests for server data. When the presentation layer kicks off a process that needs some data from the server, it's routed through this file, which supplies some pre-set "loader" data in the meantime, and returns the server data to the presentation layer when it comes back.

### /logic

This folder is supposed to handle glitches and specify the internal and external classes that the rest of the code utilizes. It doesn't do too much at the moment.

### /ui

Most of the ui widgets are found here. 

#### /components

Holds reusable components, like summary cards, full cards, buttons, dialogs, and screen parts. If you navigate to the folder, there's another readme with more info about what each file does.

#### /mobile_app

If we use this same codebase for mobile, the mobile-specific screen layouts would be defined here. See the note at the bottom for more details.

#### /screens

Where individual screens are built.

#### /web_app

Takes care of web routing and tacking the global screen components (like the AppBar and footer) onto each screen.

#### main.dart

The main method called when the app starts.

#### screen_list.dart

Turns each screen body into a web screen, as specified in /web_app.

#### styles.dart

Global fonts, colors, shapes, etc. *Needs to be utilized eventually.*

### /util

Contains sample data to be used when building new components, as well as non-functional scrollbar (since Flutter Web doesn't have a built-in scrollbar yet).

### routes.dart

Specifies the routes that the Navigator uses to push and pop pages off of the stack.

### routing_data.dart

This is supposed to be used for giving each issue page a unique URL, but it's non-functional currently.

### size_helper.dar

A placeholder file for when the mobile app comes in, to query the device screen size and adjust the layout style accordingly. See the note at the bottom for more details.

### string_extensions.dart

To be used with routing_data.dart, also non-functional.

**Note:** Because we're using Flutter, the web and mobile versions share this same codebase. Right now, we're only working on the web version. When it's time to build the mobile version, we will either 1) copy the code into another repo and modify it for the smaller screen size, or 2) we will build it in this same repo, with a tool that detects the screensize to judge whether to use a web or mobile layout (which will likely share the same components).