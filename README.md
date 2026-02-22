# E-Commerce Fruit Hub
[![Ask DeepWiki](https://devin.ai/assets/askdeepwiki.png)](https://deepwiki.com/Mohamed-Hazem-Shawqy/E-CommerceFruit-hub)

Fruit Hub is a complete e-commerce mobile application developed with Flutter. It provides a seamless shopping experience for users to browse, search, and purchase fresh fruits. The application is built with a focus on clean architecture and robust state management, utilizing Firebase for backend services.
![image alt](https://github.com/Mohamed-Hazem-Shawqy/E-CommerceFruit-hub/blob/ebc2cdf1a909d3b5328633384814305b16095529/fruit_hub_images.png)
## Features

- **User Authentication**: Secure sign-up and sign-in using email/password, Google, and Facebook.
- **Onboarding Experience**: A guided introduction for new users to the app's features.
- **Product Discovery**: Browse a comprehensive list of products, view best-sellers, and see featured offers.
- **Shopping Cart**: Easily add, remove, and manage items in the cart. The total price is calculated dynamically.
- **Search & Filter**: Find products quickly with an integrated search bar and filtering options.
- **User Profile Management**: A dedicated section for users to view their information.
- **Localization**: Supports multiple languages, with Arabic configured out-of-the-box.
- **Responsive UI**: A clean and intuitive user interface that adapts to different screen sizes.

## Architecture

The project follows the principles of **Clean Architecture**, organizing the codebase into three main layers:

-   **Presentation Layer**: Contains the UI (views and widgets) and state management logic (Cubits).
-   **Domain Layer**: Includes the core business logic, entities, and repository interfaces (declarations).
-   **Data Layer**: Responsible for data retrieval and storage, implementing the repository interfaces and interacting with data sources like Firebase.

State management is handled using the **BLoC (Cubit)** pattern, ensuring a predictable and scalable state flow throughout the application.

## Tech Stack & Key Packages

-   **Framework**: Flutter
-   **Backend & Authentication**: Firebase (Authentication, Cloud Firestore)
-   **State Management**: `flutter_bloc`
-   **Dependency Injection**: `get_it`
-   **Routing**: Custom on-the-fly route generation
-   **Localization**: `easy_localization`
-   **Navigation**: `persistent_bottom_nav_bar`
-   **UI Helpers**: `skeletonizer`, `modal_progress_hud_nsn`, `dots_indicator`
-   **Asynchronous Programming**: `dartz` for functional error handling

## Project Structure

The project's code is structured to maintain a clear separation of concerns, making it scalable and easy to maintain.

```
lib/
├── core/            # Shared components, services, utilities, and base classes
│   ├── cubits/
│   ├── entities/
│   ├── errors/
│   ├── repos/
│   └── services/
│
└── features/        # Application features (e.g., auth, home, cart)
    ├── auth/
    ├── cart/
    ├── home/
    └── ...
```

## Getting Started

To get a local copy up and running, follow these simple steps.

### Prerequisites

-   Flutter SDK installed. You can find instructions [here](https://flutter.dev/docs/get-started/install).
-   A configured Firebase project.

### Installation & Setup

1.  **Clone the repository:**
    ```sh
    git clone https://github.com/Mohamed-Hazem-Shawqy/E-CommerceFruit-hub.git
    ```

2.  **Navigate to the project directory:**
    ```sh
    cd E-CommerceFruit-hub
    ```

3.  **Set up Firebase:**
    -   Create a new project on the [Firebase Console](https://console.firebase.google.com/).
    -   Add an Android and/or iOS app to your Firebase project.
    -   Follow the Firebase setup instructions to download the `google-services.json` file for Android and the `GoogleService-Info.plist` file for iOS.
    -   Place `google-services.json` in the `android/app/` directory.
    -   Place `GoogleService-Info.plist` in the `ios/Runner/` directory.

4.  **Install dependencies:**
    ```sh
    flutter pub get
    ```

5.  **Run the application:**
    ```sh
    flutter run
