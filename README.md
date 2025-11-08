# Product List App
## Description:
This project is a test task in Dots Mobile. The app displays a list of products stored in a local JSON file and allows users to add items to a favorites list.

## 📲 Features
1. Tab bar with two screens: Products and Favorites.
2. Products list:
  - Name, category, price, and favorite status indicator.
  - Search by product name.
  - Empty state when no results match the filter.
  - Tap on an item to open the details screen.
3. Details screen:
  - Full product information.
  - Button to add/remove item from Favorites with state syncing back to the list.
4. Favorites persist between launches.

## 🛠️ Technology Stack
1. SwiftUI — UI layer.
2. ObservableObject + EnvironmentObject state management.
3. CoreData — persistence for favorites.
4. Combine — state and data flow binding.
