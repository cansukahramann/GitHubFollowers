# GitHub Followers Project 🐙

<p align="center">
  <img src="https://github.com/user-attachments/assets/a2c701d6-7cff-4049-a683-81d1d6993091" width="200" />
  <img src="https://github.com/user-attachments/assets/1bfdc10b-1949-4d9d-8f5d-63303804ad02" width="200" />
  <img src="https://github.com/user-attachments/assets/c1e2de5d-faf7-4da1-95ee-a3f59fc4729b" width="200" />
</p>

<p align="center">
  <img src="https://github.com/user-attachments/assets/02870112-6f10-46fb-a51a-e4eaf56d421e" width="200" />
  <img src="https://github.com/user-attachments/assets/7b4428d9-7cf3-4c39-a66c-e072dc94d14f" width="200" />
  <img src="https://github.com/user-attachments/assets/ed971390-845f-44c5-8d35-0c81d7b32044" width="200" />
</p>


## About the Project 📱

### Objective:
Develop an application that lists followers by searching for GitHub accounts. 🔍

### Technologies:
- Swift 🖥️
- UIKit 🎨
- URLSession 🌐
- Auto Layout 📏
- MVC architecture 🏗️

## Key Features ✨

### User Search 🔎:
- Fetch follower information by entering a GitHub username into the search bar. 💻
- Display alerts for invalid or empty inputs. ⚠️

### Follower List 📜:
- List followers' names, avatars, and profile links. 🧑‍💻
- Support infinite scrolling to load followers page by page. 🔄

### Add to Favorites ⭐:
- Allow users to select favorite followers and save them locally. 💾
- Provide options to view and remove favorite followers. 🗑️

### User Details 👤:
- Display detailed GitHub profile information for selected followers. 📝

## API Used 💥

### GitHub API:
- Used to fetch user information and followers. 🌍
- Data from the API is transformed into model structures. 🏗️

## Architecture 🏛️

### MVC (Model-View-Controller):
- Ensures separation of concerns by organizing code into Models, Views, and Controllers. 🎯

## Design Details 🎨

### Main Screen:
- Includes a search bar for entering GitHub usernames. 🔍
- Displays followers' names and avatars in a list view. 🖼️

### Detail Screen:
- Shows detailed GitHub profile information (e.g., bio, followers count, following count). 📊
- Includes an "Add to Favorites" button for saving users as favorites. 💖

### Favorites Screen:
- Lists GitHub users added to favorites. ⭐

## Technical Details 🛠️

### Networking:
- Uses URLSession for API requests. 🌐
- Includes error handling and a loading indicator. ⏳

### Modeling:
- Codable protocol used for transforming API responses. 📦
- User and follower models created. 🧑‍💻

### Local Storage 💾:
- Favorites stored using UserDefaults. 📦
- A helper class manages storage operations. 🔧

## Challenges and Solutions 💡

### Infinite Scrolling 🔄:
- Implemented pagination to optimize performance. ⚡

### API Rate Limits ⚠️:
- Added appropriate alerts to inform users about API limitations. 🚫

### Error Handling ⚠️:
- Displayed user-friendly messages for API connection issues and unexpected errors. 📣
