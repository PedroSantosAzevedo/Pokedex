# PokedexMVVM

## Project Description
This project is created using UIKit and ViewCode to retrieve and show a list of Pokémon from the https://pokeapi.co.

The first view shows a list containing an image, number, type of the Pokémon (represented as the color of the cell), and a button for saving that Pokémon as a favorite. The view also has a search feature that allows the user to search for the name and ID of the desired Pokémon.

The second tab shows the favorited Pokémon, allowing the user to list and search for their favorites. Those Pokémon are saved locally using UserDefaults.

In both views, when a Pokémon is selected, the app directs to a DetailView, which shows a bigger and better picture of the selected Pokémon, as well as its stats and characteristics.

Finally, the app contains an error view that can be added as a subview for any other view. In the example, the view is used in the list view and is shown when the app cannot retrieve the full list or any search made.

## Architecture Description
This PokedexMVVM project is built following the MVVM (Model-View-ViewModel) architecture pattern.

It heavily utilizes protocols to easily swap objects, allowing for flexibility and reusability throughout the codebase. For example, the ListView and FavoritesListView share the same controllers and views, with the only difference being the ViewModel swapped. This approach streamlines development, promotes code reusability, and enhances maintainability.

The ViewModel communicates with the controllers through the Delegate Pattern, enhancing the decoupling between layers and allowing for better testability and maintainability. This pattern facilitates the ViewModel to notify the Controllers of changes and updates in the data, enabling a seamless and reactive user interface.

## Network Layer 
It incorporates a network layer for handling API requests and responses efficiently, allowing for reusability and segregation from the viewModel and controllers.

## Coordinator Layer and Router Layer
The project utilizes a coordinator layer to encapsulate all the responsibility of creating views, injecting their respective dependencies, and easily returning a complete new flow of the app. The use of a coordinator also permits adherence to SOLID principles, specifically the Segregation of Responsibility, by centralizing the navigation logic and separating it from the view controllers.

It also uses a router layer that conforms to the RouterProtocol. This approach permits the call of any flow from any place in the app using a dictionary to pass any needed information, giving the app flexibility for calling paths from multiple sources of the app and removing the need for duplications.


## ViewCode
All views in this app are created using code only. It uses a ViewCodeProtocol to ensure the same structure between all views.

## Theme
The app uses a Theme struct containing enums for colors and fonts that take advantage of a UIColorExtension to easily create new colors from RGB data. This facilitates the creation of views and allows the app to follow the same design principles for all views. And permitting an easy changes of looks by tweeaking this struct.

## Accessibility
Accessibility is a key aspect of this project's development. Efforts have been made to ensure that the application is usable and navigable for users with disabilities. Features such as VoiceOver and the use of accessibility labels, hints, and containers combining multiple subviews to create an easier experience.

## UnitTesting
For tests, the project is covered in all ViewModels where all the heavy logic is created, allowing for safe changes that won't affect other functionalities.

## UITesting
For UI tests, the project is covered using the automatically generated UITests, testing the main list view and the detail view.

## Libraries Used
This project utilizes the following libraries:

- **Alamofire**: Alamofire is used for networking tasks, providing a powerful and elegant interface for handling HTTP requests and responses.
- **Kingfisher**: Kingfisher is employed for image retrieval and caching, allowing for efficient and seamless loading of images from URLs. Its caching mechanism enhances performance by reducing redundant network requests.
- **SVGKit**: SVGKit is utilized in this project for handling Scalable Vector Graphics (SVG) files. It provides functionalities to parse, render, and manipulate SVG images efficiently. With SVGKit, the application can seamlessly incorporate vector-based graphics, allowing for crisp and scalable images across various screen sizes and resolutions.
