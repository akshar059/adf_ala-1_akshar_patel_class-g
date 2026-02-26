# Countries Explorer – Flutter REST API Project

## Student Details
**Name:** Akshar Patel  
**Enrollment Number:** 20230905090502  
**Course:** android development framework  
**Assignment:** API Integration using Flutter  
**Type:** Individual Assignment

---

## 1. Project Overview
**Countries Explorer** is a Flutter application that integrates a public REST API to fetch real-time country data. The app retrieves JSON data from an online API, parses it into Dart model classes, and dynamically displays it using `ListView` and `GridView` widgets.

The project demonstrates:
- REST API integration
- HTTP requests in Flutter
- JSON parsing
- Model class implementation
- Error handling
- Loading indicators
- Search functionality
- Clean UI design
- GitHub project structure

## 2. API Used
**Public REST API:** [https://restcountries.com/v3.1/all](https://restcountries.com/v3.1/all)  
**API Name:** REST Countries API

**Features provided by API:**
- Country name
- Capital
- Region
- Subregion
- Population
- Flag image
- Currency
- Language

This API does not require authentication and returns data in JSON format.

## 3. Technologies Used
- Flutter SDK
- Dart Programming Language
- HTTP package
- REST API
- JSON parsing
- Material Design UI

## 4. Application Features
### Core Features:
- Fetches live data from REST API
- Displays country list using `ListView`
- Shows flag images using `NetworkImage`
- Displays capital, region and population
- Search bar to filter countries
- Pull-to-refresh functionality
- Loading indicator during API call
- Error handling if API fails

### Advanced Features:
- `GridView` toggle option
- Clean architecture using model class
- Null-safety handling
- Structured project folder organization
- Responsive UI

## 5. Project Structure
```text
lib/
  main.dart
  models/
    country_model.dart
  services/
    api_service.dart
  screens/
    home_screen.dart
```
### Explanation:
- **`main.dart`**: Entry point of the application.
- **`country_model.dart`**: Contains model class for parsing JSON into Dart objects.
- **`api_service.dart`**: Handles HTTP request and API integration logic.
- **`home_screen.dart`**: UI design, ListView/GridView, search bar, and data display.

## 6. How API Integration Works
1. **Step 1**: The HTTP package sends a GET request to the REST Countries API.
2. **Step 2**: The API returns JSON data.
3. **Step 3**: The JSON data is decoded using `jsonDecode()`.
4. **Step 4**: Each JSON object is converted into a `Country` model object.
5. **Step 5**: The list of `Country` objects is displayed using `ListView.builder()`.

## 7. JSON Parsing Explanation
The API returns a list of JSON objects. The model class extracts:
- `name.common`
- `capital[0]`
- `region`
- `population`
- `flags.png`

Null checks are used to prevent runtime errors.

## 8. Output Description
**When the app starts:**
- The student name and enrollment number appear at the top.
- A loading indicator is displayed.
- Countries data is fetched from the API.
- The list of countries appears with flag, name, capital, region, and population.

**Search Feature:**
- User can type country name in search bar.
- The list filters automatically.

**Error Handling:**
- If internet is not available, an error message is shown.
- If API fails, proper error text is displayed.

## 9. Screenshots Section
*Add screenshots here after running the app:*
- Home Screen
- Search Functionality
- Grid View Mode
- Error Screen
- Loading Indicator

## 10. How to Run the Project
1. **Step 1**: Install Flutter SDK.
2. **Step 2**: Clone the GitHub repository:
   ```bash
   git clone https://github.com/akshar059/adf_ala-1_akshar_patel_class-g.git
   ```
3. **Step 3**: Navigate to project folder:
   ```bash
   cd akshar_ala2
   ```
4. **Step 4**: Get dependencies:
   ```bash
   flutter pub get
   ```
5. **Step 5**: Run the application:
   ```bash
   flutter run
   ```

## 11. Learning Outcomes
Through this assignment, I learned:
- How to integrate REST APIs in Flutter
- How to parse complex JSON data
- How to create model classes
- How to manage asynchronous programming using `Future`
- How to implement search functionality
- How to handle API errors
- How to structure a professional Flutter project

## 12. Conclusion
This project successfully demonstrates the integration of a public REST API into a Flutter application. The app dynamically fetches and displays real-time country data using JSON parsing and structured architecture.
