![Repository Banner](https://github.com/AkshayShineKrishna/Netflix_App_UI_Clone/blob/Beta/Screenshots/repo%20banner.jpg)
# Netflix App UI Clone

The Netflix App UI Clone repository is a project that replicates the user interface of the popular streaming platform, Netflix. This repository serves as a comprehensive resource for developers interested in understanding and recreating the visually appealing and feature-rich Netflix interface made using Flutter.

The clone utilizes data from [TMDB's API](https://developer.themoviedb.org/docs) to fetch and display movie and TV show information, ensuring an up-to-date and dynamic user experience. Built using Flutter, a versatile and cross-platform framework, this project showcases the power and flexibility of Flutter in creating visually stunning and responsive user interfaces.

By exploring the Netflix UI Clone repository, developers can gain insights into the integration of external APIs, UI design patterns, state management, and more, all within the context of a real-world application. It provides a hands-on opportunity to learn and practice Flutter development while building a high-fidelity clone of the Netflix interface.

Please note that this repository is intended for educational and personal use, and it is not affiliated with or endorsed by Netflix or TMDB.

## Tech Stack

- 💻 Flutter: a powerful and flexible framework for building beautiful and performant user interfaces across multiple platforms.
- 🎯 Dart: the programming language used in combination with Flutter to create the logic and functionality of the Netflix UI Clone.
- 🐍 Python: a versatile programming language used for backend development.
- 🌐 Flask: a lightweight web framework in Python used to create the API endpoints and handle requests.
- 🎥 TMDB API: the primary source of data for movie and TV show information.
- 🚀 Custom Python API: a custom-built API in Python that combines and processes the results of the TMDB APIs, providing additional functionality not directly available from TMDB.
- 🗂️ Git: version control system for tracking changes and collaborating with others.
- 🌐 GitHub: hosting platform for managing and sharing the repository.

## Screenshots
<img src="https://github.com/AkshayShineKrishna/Netflix_App_UI_Clone/blob/Beta/Screenshots/1.png" width="32%"> <img src="https://github.com/AkshayShineKrishna/Netflix_App_UI_Clone/blob/Beta/Screenshots/2.png" width="32%"> <img src="https://github.com/AkshayShineKrishna/Netflix_App_UI_Clone/blob/Beta/Screenshots/3.png" width="32%"> <img src="https://github.com/AkshayShineKrishna/Netflix_App_UI_Clone/blob/Beta/Screenshots/4.png" width="32%"> <img src="https://github.com/AkshayShineKrishna/Netflix_App_UI_Clone/blob/Beta/Screenshots/5.png" width="32%"> <img src="https://github.com/AkshayShineKrishna/Netflix_App_UI_Clone/blob/Beta/Screenshots/6.png" width="32%">

## Getting Started

### Prerequisites

- Flutter SDK: Make sure you have Flutter installed on your machine. You can download and install Flutter from the official Flutter website.
- Flutter IDE: Choose an IDE for Flutter development such as Android Studio, Visual Studio Code, or IntelliJ IDEA. Install the required plugins/extensions for Flutter development in your chosen IDE.
- TMDB API Key: Create your own API key from the TMDB website. The API key is required to fetch movie and TV show data. Follow the steps below to generate your TMDB API key.

### Generating TMDB API Key

1. Visit the TMDB website at [https://www.themoviedb.org/](https://www.themoviedb.org/) and create an account if you don't have one already.

2. Once logged in, navigate to your account settings.

3. In the account settings, select the "API" section.

4. Click on the "Request an API key" button.

5. Provide the necessary information and follow the instructions to generate your API key.

6. Copy the generated API key.

### Installation

1. Clone the repository to your local machine using the following command:

```
git clone https://github.com/AkshayShineKrishna/Netflix_App_UI_Clone.git
```
2. Open the project in your preferred Flutter IDE.

3. Install the required dependencies by running the following command in the project root directory:

```
flutter pub get
```

### Configuration
1. Open your preferred Flutter IDE and navigate to the project directory.

2. In the project directory, create a new file named api_key.dart in the lib\Infrastructure .

3. Open the api_constants.dart file and declare a variable named apiKey:
```
const String apiKey = 'YOUR_API_KEY';
```

4. Replace 'YOUR_API_KEY' with your actual TMDB API key.

5. If necessary, update the import statements in your project files (lib\Domain\core\api_endpoints.dart) to include the newly created api_key.dart file.

6. Save the api_constants.dart file.

### Running the App

1. Connect your Android or iOS device to your development machine or use a simulator/emulator.

2. Ensure that your device or emulator is recognized by running the following command in the project root directory:

```
flutter devices
```

3. Once your device is recognized, run the app using the following command:
```
flutter run
```
This command will build and run the app on your connected device or emulator.

## Folder Structure

1. **Application**: It is divided into subfolders for each screen (`downloads`, `home`, `hot_and_new`, `search`), and each subfolder contains the corresponding bloc files (*_bloc.dart) , (*_state.dart) and event files (*_events.dart).

2. **Core** : Holds essential core components and configurations of the application. It includes:
  - Colors : Contains the colors.dart file that defines constant theme colors used throughout the app.
  - constants.dart: Stores constant values, such as spacing and sized box dimensions.
  - di: Contains the injectable.dart file, which sets up dependency injection configurations for the app.
  - strings.dart: Contains base URLs for API calls and network images.

3. **Domain** : Represents the domain layer of the application and is organized based on each screen. It contains subfolders for each screen (downloads, home, hot_and_new, search), and each screen folder further includes:
  - model: Contains the data models specific to that screen.
  - services.dart: Holds the services related to that screen, such as API requests or data handling.

4. **Infrastructure** : Contains the implementation details and repositories for each screen. It includes:
  - api_key.dart: A file that users have to create (as mentioned in the instructions) to store their TMDB API key.
  - Subfolders for each screen (downloads, home, hot_and_new, search), which contain the implementation of the repositories used by the services.

5. **Presentation** : Responsible for the presentation layer of the application. It includes subfolders for each screen (downloads, home, hot_and_new, search). Each screen folder contains:
  - widgets: Contains the specific widgets used by that screen.
  - {screen_name}_screen.dart: The main Dart file for each screen, which defines the UI and handles user interactions.

6. main.dart: The entry point of the Flutter application.

## Contributing

Contributions are welcome! If you find any issues or have suggestions for improvements, feel free to create a pull request or open an issue in the GitHub repository.
