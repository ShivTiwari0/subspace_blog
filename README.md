# Subspace Blog

Welcome to **Subspace Blog**, a modern blog application built with Flutter. This app allows users to explore, favorite, and manage blogs with a smooth and interactive UI.

![Subspace Blog Logo](assets/images/logo.png) <!-- Replace with your logo image path -->

## Features

- **Explore Blogs:** Browse a wide range of blog posts with rich content and images.
- **Favorite Blogs:** Save your favorite blogs and access them anytime.
- **Responsive Design:** Optimized for both mobile and tablet devices.
- **Real-time Updates:** Stay updated with the latest blogs and changes.
- **Local Storage:** Uses Hive for offline mode and SharedPreferences for favorites.

## Getting Started

### Prerequisites

- Flutter SDK 3.x or later
- Dart SDK 3.x or later

### Installation

1. **Clone the repository:**

    ```bash
    git clone https://github.com/ShivTiwari0/subspace_blog.git
    cd subspace_blog
    ```

2. **Install Flutter dependencies:**

    ```bash
    flutter pub get
    ```

3. **Run the app:**

    ```bash
    flutter run
    ```

## Configuration

### API Configuration

Update the base URL and other configurations in the `lib/core/api.dart` file to point to your backend server.

### Preferences

- Store and retrieve user preferences using the `Preference` service.
- Modify preference settings in `lib/logic/services/preference.dart`.

## Development

### Folder Structure

- `lib/core/`: Core utilities and constants.
- `lib/data/`: Data models and repository classes.
- `lib/logic/`: Cubits and business logic.
- `lib/presentation/`: UI components and screens.

### State Management

We use **Cubit** for state management. Explore `lib/logic/cubits/` for various state management implementations.

### Contributions

We welcome contributions! If you'd like to contribute, please fork the repository and submit a pull request with your changes.

1. **Fork the repository**
2. **Create a feature branch**
3. **Commit your changes**
4. **Push to the branch**
5. **Submit a pull request**

### Reporting Issues

If you encounter any issues, please report them on the [GitHub Issues page](https://github.com/ShivTiwari0/subspace_blog/issues).

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact

For any questions or feedback, feel free to contact me at [shivansh.tiwari130899@gmail.com](mailto:shivansh.tiwari130899@gmail.com).
