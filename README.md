# Top Stars README

## Introduction
This README provides an overview of the key components and architectural decisions made in the development of the project. It serves as a guide for understanding the structure and functionality of the Swift project.

## Table of Contents
1. [General](#general)
2. [MVVM Pattern](#mvvm-pattern)
3. [Reusable View Components](#reusable-view-components)
4. [Skeleton with Shimmer Effect](#skeleton-with-shimmer-effect)
5. [Dark Mode Support and Custom Color Palette](#dark-mode-support-and-custom-color-palette)
6. [Dependency Injection and Testability](#dependency-injection-and-testability)
7. [Core Data Integration](#core-data-integration)
8. [DAO Layer](#dao-layer)
9. [Error Handling with Combine](#error-handling-with-combine)
10. [Version Control with Git](#version-control-with-git)

---

## 1. General
This project uses custom views created entirely by code, including manually defined constraints. This method is prefered over storyboards or xib files because it offers more flexibility and simplifies code review that would be otherwise impossible. On the other hand, while SwiftUI is faster for prototyping, UIKit provides more options for creating complex user interfaces.

Although the project is built with UIKit's tools, all of this could be easily replicated in SwiftUI. If needed, the project can be adapted to SwiftUI while keeping the same overall structure, although this adaptation might involve migrating to some SwiftUI-specific patterns like the use of Repository instead of ViewModel and adopting a more declarative / reactive architecture.

## 2. MVVM Pattern
The project follows the MVVM (Model-View-ViewModel) architectural pattern. MVVM strikes a balance between complexity and simplicity, separating concerns effectively. The ViewModel (VM) controls business logic, while the ViewController (VC) manages view-related tasks. Communication with services and the network layer in general occurs in the ViewModel, while the ViewController controls all view-related elements such as the user interaction or knowing which cell is expanded.

## 3. Reusable View Components
Multiple independent components for views are utilized, enhancing reusability and improving clarity through view composition. A `ViewConstants` struct centralizes numerical values for constraints, strings that would otherwise be hardcoded in the middle of the code, promoting maintainability and consistency.

## 4. Skeleton with Shimmer Effect
The project includes a skeleton with a shimmer effect, that can only be seen once. If you missed it, you can delete the app and reinstall to see it again. If you do so in airplane mode and press the cancel button, you can see it indefinitely. 

Its optimized using the width and 'x' origin of the container view to create a sweeping shine across the screen, adjusting start time and length of the animation accordingly. Configuration constants outside the code body allow for easy adjustment, including timing, span and broadness of the animation. The perceived effect is that items to the left appear to be shining first and items to the right shining later.

## 5. Dark Mode Support and Custom Color Palette
The project incorporates support for dark mode and implements a custom color palette for consistent theming throughout the application.

## 6. Dependency Injection and Testability
While only one XCTest was created for this exercise, it's important to note that in real-world projects, more test coverage would be necessary to ensure functionality validation. This shows how using dependency injection can make testing simpler afterwards, emphasizing the importance of designing code with testing in mind.

I opted for the HomeViewModel to create the XCTest, because it handles critical business logic, making it the primary focus for testing. While testing Views is important, the ViewModel's role in managing business logic makes it key to ensure. application reliability and functionality

## 7. Core Data Integration
Core Data is utilized for data persistence. There is a CoreDataManager singleton to handle it all, whose backbone elements are defined first, and then the sections for various operations (e.g., fetching, saving, deleting entities) are organized using `MARK` annotations to improve clarity.

## 8. DAO Layer
The Data Access Object (DAO) layer, implemented using Combine, serves as an intermediary between networking services and Core Data. It abstracts data handling, ensuring the ViewModel remains agnostic to the data source, thereby enhancing modularity and maintainability.

## 9. Error Handling with Combine
Combine built in tools are used for error handling, enabling the propagation of ServiceError throughout the application from the network layer to the view where it's finally displayed. Enums with associated values are employed to categorize and display different types of errors. Error messages are presented using Lottie animations in a child view controller called ErrorViewController.

An Action closure is used to inform the parent view controller about user actions in the child view controller. This is used to enhance clarity and maintainability in our codebase while promoting loose coupling between different screens.

## 10. Version Control with Git

Even though it wasn't a requirement, this project was completed within a span of less than 24 hours, as evidenced by the project history in the Git repository. Throughout the development process, I followed standard practices by creating feature branches and pull requests, mirroring the workflow I would typically employ in my own projects. This approach allows you to have insight not only about the code itself, but also into how the creation process went.

---

## Organization

The project follows a well-organized structure with the following folders:

- **Resources**: Designed to contain images, assets, and Lottie JSONs for easy accessibility and maintenance.
- **Components**: Contains reusable components, promoting code reusability and modularity.
- **CoreData**: Manages data persistence logic, including managed objects, context, and managers.
- **Screens**: Organizes ViewControllers (VC) and ViewModels (VM) for clear separation of concerns and easy navigation.
- **Helpers**: Stores extensions and utility classes for improved code cleanliness and maintainability.
- **Entities**: Holds DTOs (Data Transfer Objects) to separate data models from other components.
- **Network**: Centralizes networking-related logic, including service and DAO (Data Access Object) classes.

---

### Disclaimer

Please note that artificial intelligence tools, such as ChatGPT, were only used to refine the readability of this README. They were not involved in the creation of any part of the code or in any other aspects of the project.


This README is an overview of the project's architecture, design decisions, and key features. For detailed implementation and usage information, refer to the project's codebase. If you have any specific questions or need further clarification, feel free to reach out for assistance.
