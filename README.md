Manage daily **income** and **expense** transactions with real-time currency conversion (USD ↔️ UZS) using the official NBU Public API.  
The app includes **Firebase Authentication**, Google Sign-In, and a clean UI with multiple screens for easy navigation.

---

## ✨ Features

### 🔹 Authentication (Firebase)
- **Login / Signup** with email & password  
- **Password reset** via email  
- **Google Sign-In** support  
- User profile data synced with Firebase  

### 🔹 Transactions
- Add **Income** or **Expense**  
- Choose category by type (income / expense)  
- Enter amount in **USD** or **UZS**  
- Store **date & time** of transaction  
- **Edit** or **Delete** any transaction  
- Currency conversion with **NBU Public API**  

### 🔹 Screens
- **Splash Screen** – Initial loading screen  

- **Login Screen** – Sign in with email/password or Google  
- **Signup Screen** – Register a new account  
- **Home Screen** – View list of all transactions  
  - Display: type (income/expense), date, category, amount (USD/UZS)  
  - Toggle between **USD** and **UZS** based on real-time exchange rates  
- **Profile Screen** – View user profile  
  - Email & Full Name  
  - Profile image (Google accounts only)  


## 🛠 Tech Stack
- **Flutter** – UI development  
- **Firebase Authentication** – User auth & Google Sign-In  
- **Cloud Firestore** – Storing transactions  
- **NBU Public API** – Exchange rate (USD ↔️ UZS)  
- **Bloc / Cubit** (or Provider, depending on your architecture) – State management  

---

## 📸 Screenshots (Optional)
<img width="206" height="722" alt="Simulator Screenshot - iPhone 16 Pro - 2025-09-06 at 17 13 06" src="https://github.com/user-attachments/assets/0bdec835-8f6b-4176-b4bf-0d4b6e75648a" /> <img width="206" height="722" alt="Simulator Screenshot - iPhone 16 Pro - 2025-09-06 at 17 13 37" src="https://github.com/user-attachments/assets/ef872c49-e1ff-4390-b7f5-f95ce80d1979" /> <img width="206" height="722" alt="Simulator Screenshot - iPhone 16 Pro - 2025-09-06 at 17 14 21" src="https://github.com/user-attachments/assets/1c098034-f4d6-4dcb-bcd6-76b4de07dc1e" /> <img width="206" height="722" alt="Simulator Screenshot - iPhone 16 Pro - 2025-09-06 at 17 18 50" src="https://github.com/user-attachments/assets/9adc5227-cb4b-42c0-bed1-8aa2b5428545" /> <img width="206" height="722" alt="Simulator Screenshot - iPhone 16 Pro - 2025-09-06 at 17 20 38" src="https://github.com/user-attachments/assets/7db73ca1-efec-4582-ae07-69c08b4ee157" /> <img width="206" height="722" alt="Simulator Screenshot - iPhone 16 Pro - 2025-09-06 at 17 21 30" src="https://github.com/user-attachments/assets/c99bdcfc-23db-47c4-8104-5a4f9618045d" /> <img width="206" height="722" alt="Simulator Screenshot - iPhone 16 Pro - 2025-09-06 at 17 14 45" src="https://github.com/user-attachments/assets/77acbcba-ec42-4b3e-a924-7941789dbadd" />




### Prerequisites
- Flutter SDK installed  
- Firebase project setup  
- iOS/Android emulator or physical device  
