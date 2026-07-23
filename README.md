# initials_avatar_builder

A customizable Flutter widget that automatically generates beautiful circle avatars with user initials, dynamic background colors, and gradient support.

## Features

* **Automatic Initials:** Extracts up to 2 initials from a given name automatically. Handles single names and multi-word names gracefully.
* **Auto-generated Colors:** If no color is provided, it assigns a consistent, visually pleasing background color based on the hash of the user's name. (e.g. "Shahzain" will always have the same background color).
* **Gradient Support:** Opt-in support for gorgeous modern gradients using the `backgroundGradient` property.
* **Dynamic Sizing:** Text sizes automatically adjust to fit perfectly within the avatar whether there are 1 or 2 initials.
* **Highly Customizable:** Control radius, text color, font size, background color, and gradients.

## Getting started

In the `dependencies:` section of your `pubspec.yaml`, add the following line:

```yaml
dependencies:
  initials_avatar_builder: ^0.0.1
```

Then import the package in your Dart code:

```dart
import 'package:initials_avatar_builder/initials_avatar_builder.dart';
```

## Usage

### 1. Default Auto-Color Avatar
Provides standard initials and a consistently generated solid color.

```dart
InitialsAvatar(name: 'Shahzain Baloch'),
```

### 2. Custom Solid Color
Override the background color and radius.

```dart
InitialsAvatar(
  name: 'Farooq Ahmad',
  radius: 40,
  backgroundColor: Colors.black,
),
```

### 3. Gradient Avatar
Use a beautiful custom gradient instead of a solid color.

```dart
InitialsAvatar(
  name: 'Developer',
  radius: 50,
  backgroundGradient: LinearGradient(
    colors: [Colors.purple, Colors.deepOrange],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
),
```

### 4. Single Name
Automatically centers the single initial and scales the font size.

```dart
InitialsAvatar(
  name: 'Amanullah',
  radius: 30,
),
```

## Author
Developed by **Shahzain Baloch**.
