# PokedexMVVM

## Project Description
This project retrieves and show a list of Pokemons from the https://pokeapi.co.

The first view shows a list containing image, number, type of the pokemon(represented as the color of the cell), and a buttuon for saving that Pokemon as favorite. The view also has a serach feature that allows the user to search for name and id of the desired Pokemon

The second tab shows the favorited pokemons. Allowing the user to list and search for their favorite. Those pokemons are saved locally using UserDefaults.

In both views, when a pokemon is selected, the app directs do a DetailView, that shows a bigger and better picture of the selected pokemon, as well as their stats and characteristics.

## Architecture Description
This PokedexMVVM project is built following the MVVM (Model-View-ViewModel) architecture pattern.

It heavily utilizes protocols to easily swap objects, allowing for flexibility and reusability throughout the codebase.
Using as example, the ListView and FavoritesListView share the same controllers and views, with the only difference being the ViewModel swapped. This approach streamlines development, promotes code reusability, and enhances maintainability.

The ViewModel communicates with the controllers through the Delegate Pattern, enhancing the decoupling between layers and allowing for better testability and maintainability. This pattern facilitates the ViewModel to notify the Controllers of changes and updates in the data, enabling a seamless and reactive user interface.

## Network Layer 
It incorporates a network layer for handling API requests and responses efficiently, allowing for reusability and segregation from the viewModel and controllers

## Coordinator Layer and Router Layer
The project utilizes a coordinator layer to encapsulate all the resposability of creating views, injectin their respective dependencies and easly returning a complete new flow of the app. The use of a coordinator also permits the adherence to SOLID principles, specifically the Segregation of Responsibility, by centralizing the navigation logic and separating it from the view controllers.

It also uses a router layer that conforms to the RouterProtocol. This approach permits the call of any flow from any place of the app using a dictionary to pass any needed information, this gives the apps a flexibility for calling paths from multiple sources of the app and removes the need for duplications.

## Accessibility
Accessibility is a key aspect of this project's development. Efforts have been made to ensure that the application is usable and navigable for users with disabilities. Features such as VoiceOver and the use of accessibility labels, hints and containers combining multiple subViews to create an easier experience.

## UnitTesting
For tests, the project is covered in all ViewModels where all the heavy logic is created. Allowing for safe changes that won't affect other functionalities.

## Libraries Used
This project utilizes the following libraries:

- **Alamofire**: Alamofire is used for networking tasks, providing a powerful and elegant interface for handling HTTP requests and responses.
- **Kingfisher**: Kingfisher is employed for image retrieval and caching, allowing for efficient and seamless loading of images from URLs. Its caching mechanism enhances performance by reducing redundant network requests.
- **SVGKit**: SVGKit is utilized in this project for handling Scalable Vector Graphics (SVG) files. It provides functionalities to parse, render, and manipulate SVG images efficiently. With SVGKit, the application can seamlessly incorporate vector-based graphics, allowing for crisp and scalable images across various screen sizes and resolutions.
