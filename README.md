## Favorite Place

Favorite Place is a Flutter mobile app designed to help users save and revisit their favorite locations easily. With this app, users can capture images of their favorite places, save their current location, and view them on Google Maps.

**Features:**

1. **Save Favorite Places:**
   - Users can capture images of their favorite places using their mobile phones.
   - The app fetches the current location of the user and saves it along with the captured image.

2. **View Saved Locations:**
   - Users can view their saved locations on a list screen.
   - Each saved location is represented by:
     - A circular image captured by the user.
     - A title provided by the user.
     - A human-readable address fetched from Google Maps based on the location coordinates.

3. **Google Maps Integration:**
   - Users can view their saved locations on Google Maps.
   - Each saved location is marked with a red color marker, making it easy for users to identify.
   - Users can also navigate to Google Maps directly from the app to select a location manually.

4. **Data Persistence:**
   - User data is persisted using SQLite through the Sqflite package.
   - This ensures that user data is safely stored even when the app is closed or restarted.

5. **Delete Locations:**
   - Users have the option to delete saved locations if needed.
   - Deleting a location removes it from the list and the map view.

## Technology Stack:

- Flutter: Framework for building cross-platform mobile applications.
- Riverpod: State management library for managing app state.
- Google Fonts: Library for easily adding custom fonts to Flutter apps.
- UUID: Library for generating unique identifiers.
- Image Picker: Plugin for selecting images from the device's gallery or camera.
- Location: Plugin for accessing device location.
- HTTP: Package for making HTTP requests.
- Google Maps Flutter: Plugin for integrating Google Maps into Flutter apps.
- Path Provider: Plugin for accessing the filesystem paths.
- Path: Library for working with paths in Dart.
- Sqflite: SQLite plugin for Flutter, used for local data persistence.

**How to Use:**

1. **Capture and Save:**
   - Open the app and navigate to the "Capture" screen.
   - Capture an image of your favorite place and provide a title.
   - Your current location will be automatically saved along with the image.

2. **View and Navigate:**
   - Navigate to the "Saved Places" screen to view your saved locations.
   - Click on a location to view its details, including the captured image and address.
   - Click the "View on Map" button to see the location on Google Maps.

3. **Delete Locations:**
   - Long-press on a location in the list to delete it.

## Resources:

- [App Video](https://drive.google.com/file/d/1apDx8y0kGfia2ADAj3TOrV7foCmXuwsj/view?usp=sharing)
- [App Files on Google Drive](https://drive.google.com/file/d/1E0wbEFTeRcwIMUUnOaeVZJxvfvpo6klw/view?usp=sharing)

## Screenshots

![image](https://github.com/hossain-eee/Udemy-Flutter-Section-13-Usng-Native-Device-Features-e.g.-Camera--Favorite-Place-App/assets/101991583/e49f6cb0-8795-4560-aac1-e1ed59139ff0)
![image](https://github.com/hossain-eee/Udemy-Flutter-Section-13-Usng-Native-Device-Features-e.g.-Camera--Favorite-Place-App/assets/101991583/4441c17e-85e4-4c0b-a360-45d36319734d)
![image](https://github.com/hossain-eee/Udemy-Flutter-Section-13-Usng-Native-Device-Features-e.g.-Camera--Favorite-Place-App/assets/101991583/24eada5d-82bb-435c-b691-19ab57ea75f3)
![Screenshot_1710011080](https://github.com/hossain-eee/Udemy-Flutter-Section-13-Usng-Native-Device-Features-e.g.-Camera--Favorite-Place-App/assets/101991583/b21537f0-9841-4bb8-acd9-770597ad6793)
![Screenshot_1710011308](https://github.com/hossain-eee/Udemy-Flutter-Section-13-Usng-Native-Device-Features-e.g.-Camera--Favorite-Place-App/assets/101991583/a68fad64-b252-4aaa-81b7-dde9e0010299)
![Screenshot_1710015393](https://github.com/hossain-eee/Udemy-Flutter-Section-13-Usng-Native-Device-Features-e.g.-Camera--Favorite-Place-App/assets/101991583/09891f86-c746-4104-b4b4-f7bfe4d7c6b6)
![Screenshot_1710015397](https://github.com/hossain-eee/Udemy-Flutter-Section-13-Usng-Native-Device-Features-e.g.-Camera--Favorite-Place-App/assets/101991583/81ba80bc-7cb3-48e1-b245-f85e40be2b0c)
![Screenshot_1710050564](https://github.com/hossain-eee/Udemy-Flutter-Section-13-Usng-Native-Device-Features-e.g.-Camera--Favorite-Place-App/assets/101991583/a0a251e8-739a-4963-be06-7f4ff10260c8)
![Screenshot_1710055761](https://github.com/hossain-eee/Udemy-Flutter-Section-13-Usng-Native-Device-Features-e.g.-Camera--Favorite-Place-App/assets/101991583/67b22b33-0f58-488d-bbb3-3fe9af2fbbb3)
![Screenshot_1710055769](https://github.com/hossain-eee/Udemy-Flutter-Section-13-Usng-Native-Device-Features-e.g.-Camera--Favorite-Place-App/assets/101991583/85c18246-4328-434a-b031-17bdc50481ba)
![Screenshot_1710055775](https://github.com/hossain-eee/Udemy-Flutter-Section-13-Usng-Native-Device-Features-e.g.-Camera--Favorite-Place-App/assets/101991583/80ae9bce-264b-4f54-8f5e-ea2c7064dd8b)
![image](https://github.com/hossain-eee/Udemy-Flutter-Section-13-Usng-Native-Device-Features-e.g.-Camera--Favorite-Place-App/assets/101991583/08543943-2ee6-468a-ac08-9edead67e2cf)
![Screenshot_1710322992](https://github.com/hossain-eee/Udemy-Flutter-Section-13-Usng-Native-Device-Features-e.g.-Camera--Favorite-Place-App/assets/101991583/877b29d7-7968-476c-89b2-0c9a6a117f8a)
![Screenshot_1710323001](https://github.com/hossain-eee/Udemy-Flutter-Section-13-Usng-Native-Device-Features-e.g.-Camera--Favorite-Place-App/assets/101991583/7f2f8227-3f54-4843-a9b4-360f1aeb1b10)
![Screenshot_1710323008](https://github.com/hossain-eee/Udemy-Flutter-Section-13-Usng-Native-Device-Features-e.g.-Camera--Favorite-Place-App/assets/101991583/63a71499-b7ac-4718-b7c4-a73f01edb8d2)
![Screenshot_1710415975](https://github.com/hossain-eee/Udemy-Flutter-Section-13-Usng-Native-Device-Features-e.g.-Camera--Favorite-Place-App/assets/101991583/320a68d2-19eb-4b97-9a68-9ccb7b9a3e05)
![Screenshot_1710415968](https://github.com/hossain-eee/Udemy-Flutter-Section-13-Usng-Native-Device-Features-e.g.-Camera--Favorite-Place-App/assets/101991583/fc851cd9-cf6d-4350-9d6b-de5000d070c5)
![Screenshot_1710415949](https://github.com/hossain-eee/Udemy-Flutter-Section-13-Usng-Native-Device-Features-e.g.-Camera--Favorite-Place-App/assets/101991583/d321525d-061d-4c23-b7f8-d630a38f12ef)
![1](https://github.com/hossain-eee/Udemy-Flutter-Section-13-Usng-Native-Device-Features-e.g.-Camera--Favorite-Place-App/assets/101991583/ed956ca4-cb79-48c5-9597-7159b576f3e1)
![2](https://github.com/hossain-eee/Udemy-Flutter-Section-13-Usng-Native-Device-Features-e.g.-Camera--Favorite-Place-App/assets/101991583/2a8754d7-c2ec-48c6-85a0-f82755e12a8d)
![3](https://github.com/hossain-eee/Udemy-Flutter-Section-13-Usng-Native-Device-Features-e.g.-Camera--Favorite-Place-App/assets/101991583/39525549-0a56-4ea8-8202-34fd01c69d0e)
![4](https://github.com/hossain-eee/Udemy-Flutter-Section-13-Usng-Native-Device-Features-e.g.-Camera--Favorite-Place-App/assets/101991583/c5358c84-3100-4e26-ac83-1cc81a19c479)
![5](https://github.com/hossain-eee/Udemy-Flutter-Section-13-Usng-Native-Device-Features-e.g.-Camera--Favorite-Place-App/assets/101991583/ae9cf13f-5fb2-48a0-ac49-2a1e836f5b7c)
![6](https://github.com/hossain-eee/Udemy-Flutter-Section-13-Usng-Native-Device-Features-e.g.-Camera--Favorite-Place-App/assets/101991583/3486fa9c-9ad2-4ace-b2b2-29480b3a65fa)
![Screenshot_20240320_141440](https://github.com/hossain-eee/Udemy-Flutter-Section-13-Usng-Native-Device-Features-e.g.-Camera--Favorite-Place-App/assets/101991583/b6fc4a6f-0fd3-4a6e-bc77-9d7fe6adca3b)
