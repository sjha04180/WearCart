# WearCart Setup Guide

This guide covers everything you need to know to set up **WearCart** locally on your machine. Follow these steps sequentially to ensure a smooth setup.

---

## 1. Prerequisites

Before starting, ensure you have the following installed/created:

1.  **Node.js**: Version 18 or higher.
    *   Check version: `node -v`
    *   [Download Node.js](https://nodejs.org/)
2.  **Git**: To clone the repository.
    *   [Download Git](https://git-scm.com/)
3.  **Supabase Account**: For the PostgreSQL database.
    *   [Create Free Account](https://supabase.com/)
4.  **WalletConnect Project ID**: For Web3 features.
    *   [Get Project ID](https://cloud.walletconnect.com/sign-in) (Sign in -> Create Project -> Copy Project ID)

---

## 2. Clone the Repository

Open your terminal (Command Prompt, PowerShell, or macOS Terminal) and run:

```bash
git clone https://github.com/sjha04180/Wear-Cart.git
cd Wear-Cart
```

You should now see three folders: `backend`, `frontend`, and `web3`.

---

## 3. Database Setup (Supabase)

WearCart uses a PostgreSQL database. We verify it works best with Supabase.

1.  **Create a New Project** on Supabase.
2.  Go to **Project Settings** -> **Database**.
3.  Scroll down to **Connection parameters**.
4.  Note down the following (You will need these for the Backend `.env`):
    *   **Host**
    *   **User** (usually `postgres`)
    *   **Password** (the one you set when creating the project)
    *   **Database Name** (usually `postgres`)
    *   **Port** (usually `5432` or `6543`)

> **Tip:** If you are running locally, you can use the direct connection (Port 5432). If you were deploying to Vercel, you would use the Transaction Pooler (Port 6543).

---

## 4. Backend Setup

### Step 4.1: Install Dependencies
Open a **new terminal** window, navigate to the `backend` folder, and install packages:

```bash
cd backend
npm install
```

### Step 4.2: Configure Environment Variables
Create a new file named `.env` inside the `backend` folder. Copy and paste the following, filling in your Supabase details:

**File:** `backend/.env`
```env
PORT=5000
NODE_ENV=development

# Database Configuration (Get these from Supabase)
DB_HOST=aws-0-ap-south-1.pooler.supabase.com  # Replace with YOUR Supabase Host
DB_PORT=6543                                   # Replace with YOUR Port
DB_USER=postgres.your_project_ref              # Replace with YOUR User
DB_PASSWORD=your_db_password                   # Replace with YOUR Password
DB_NAME=postgres                               # Replace with YOUR DB Name
DB_SSL=true                                    # Required for Supabase

# Frontend URL (For CORS)
FRONTEND_URL=http://localhost:3000
```

### Step 4.3: Seed the Database
This will create the necessary tables and add some sample data.

```bash
npm run seed
```
*If successful, you will see messages about tables being synchronized.*

### Step 4.4: Start the Backend Server

```bash
npm run dev
```
*You should see: `Server running on port 5000` and `Database connected successfully`.*

---

## 5. Frontend Setup

### Step 5.1: Install Dependencies
Open a **second terminal** window (keep the backend running), navigate to the `frontend` folder:

```bash
cd frontend
npm install
```

### Step 5.2: Configure Environment Variables
Create a new file named `.env.local` inside the `frontend` folder.

**File:** `frontend/.env.local`
```env
# Backend API URL
NEXT_PUBLIC_API_URL=http://localhost:5000/api

# WalletConnect Project ID (Required for "Connect Wallet" button)
NEXT_PUBLIC_WALLET_CONNECT_PROJECT_ID=your_walletconnect_project_id
```

### Step 5.3: Start the Frontend

```bash
npm run dev
```

The app will start at `http://localhost:3000`.

---

## 6. Using the Application

1.  **Open Browser**: Go to [http://localhost:3000](http://localhost:3000).
2.  **Browse Products**: You should see products loaded from your database.
3.  **Connect Wallet**: Click the "Connect Wallet" button in the top right (requires Metamask or similar browser extension).
4.  **Backend API**: You can check if the backend is running at [http://localhost:5000/](http://localhost:5000/).

---

## 7. Troubleshooting

**Issue: "Connection Refused" or "Database Error"**
*   Check your `backend/.env` file. Ensure `DB_PASSWORD` is correct (it's the database password, not your Supabase login password).
*   Ensure `DB_SSL=true` is set.

**Issue: "Window is not defined" (Frontend)**
*   This usually happens if you try to render Web3 components on the server. The current codebase handles this, but if you edit files, ensure Wallet components represent `client` side logic.

**Issue: Images not loading**
*   The sample data might use placeholder URLs. If you want to see real images, you can update the product image URLs in the database or via the Admin API.
