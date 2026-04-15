# 🍰 D'Valens

A mobile application developed for a family-owned business dedicated to food and pastry production. This project aims to modernize business operations by replacing traditional methods such as social media communication with a centralized digital solution. The application enables efficient product management, customer interaction, order handling, and service reservations, providing a scalable and user-friendly platform built with modern low-code tools.

## 🚀 Features

- 🔒 **Secure Authentication:** User registration, login, password recovery, and Google sign-in powered by Firebase.
- 🛍️ **Product Management:** Display of products with images, names, prices, and descriptions.
- 🔎 **Search System:** Real-time product filtering by name.
- 🗂️ **Dynamic Categories:** Organized product catalog with admin-controlled categories.
- 🛒 **Shopping Cart:**
  - ➕ Add/remove products.
  - 💰 Automatic price calculation.  
  - 🧾 Tax inclusion.  
  - 🔢 Quantity management.  
- 💳 **SINPE Móvil Payment Integration:** Generates a pre-filled SMS with payment details for fast transactions.
- 🍽️ **Catering Service Module:**
  - 📝 Reservation system.  
  - 👤 Customer data collection.  
  - 📜 Booking history.  
  - 💬 Direct contact via WhatsApp.  
- 👤 **User Management (Admin):**
  - ✏️ Create, edit, and delete users.  
  - 🛡️ Role assignment.  
- 🤖 **AI Chat Assistant:** Integrated assistant focused on pastry-related queries.
- 📊 **User Profile**
  - 🧑 Personal data management.  
  - 🖼️ Profile image customization.  

## 🛠️ Technologies Used

- 📱 **Frontend / App Builder:** FlutterFlow
- 🔥 **Backend & Services:** Firebase
  - 🗄️ Firestore Database  
  - 🔐 Firebase Authentication  
  - ☁️ Firebase Storage  
- ⚙️ **Logic Implementation:**
  - Custom Functions  
  - Custom Actions  
- 💬 **Integrations:**
  - WhatsApp (customer communication)  
  - SINPE Móvil (payment system)  
- 🤖 **AI Integration:** Gemini (via FlutterFlow)  

## ⚙️ Setup & Installation

> ⚠️ This project was built using **FlutterFlow**, so setup differs from a traditional Flutter project.

### 📋 Prerequisites

- 🌐 [FlutterFlow](https://www.flutterflow.io/) (low-code platform)
- 🔥 [Firebase](https://firebase.google.com/)  

### 🔧 Firebase Configuration

1. 🔨 Create a new project in Firebase.

2. ⚡ Enable the following services:
   - Authentication (Email/Password & Google)  
   - Firestore Database  
   - Storage (optional)  

3. 🧱 Set up Firestore collections:
   - 👤 Users  
   - 🛍️ Productos  
   - 🗂️ Categorías  
   - 🍽️ Catering  

4. 🔐 Configure Firebase security rules as needed.

### ▶️ Running the Project

There are two ways to run this project:

#### 1️⃣ Run via FlutterFlow (Recommended)

- Open the project in FlutterFlow.
- Connect it to your Firebase project.
- Click Run or Preview.

#### 2️⃣ Export and Run in Flutter (Optional)

If you exported the code:

- 📦 Install dependencies:

```bash
flutter pub get
```

- 🔑 Add Firebase configuration files:
    - google-services.json (Android)
    - GoogleService-Info.plist (iOS)

- ▶️ Run the app:

```bash
flutter run
```

## 🧱 Database Structure

The application uses Firestore with the following collections:
- 👤 Users → Registered user data
- 🛍️ Productos → Product catalog
- 🗂️ Categorías → Product categories
- 🍽️ Catering → Catering service reservations

> [!NOTE]
> **Project Owner / Developer** 🧑🏻‍💻  
>- Cristopher Rodríguez Fernández 
***
