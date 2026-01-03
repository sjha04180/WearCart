# Setup Guide

## 1. Quick Start (Local Development)

### Prerequisites
- Node.js 18+
- Supabase Account (for Database) OR Local PostgreSQL
- WalletConnect Project ID (for Web3)

### Installation

1.  **Clone the repository**
2.  **Install Dependencies** (in two separate terminals):
    ```bash
    # Terminal 1 (Backend)
    cd backend
    npm install

    # Terminal 2 (Frontend)
    cd frontend
    npm install
    ```

## 2. Environment Configuration

You need to create `.env` files for both backend and frontend.

### Backend (`backend/.env`)

If using **Supabase** (Recommended for Vercel/Cloud):
```env
PORT=5000
NODE_ENV=development
# Transaction Pooler Connection String (From Supabase Settings -> Database)
DB_HOST=aws-0-ap-south-1.pooler.supabase.com
DB_PORT=6543
DB_USER=postgres.[project-ref]
DB_PASSWORD=[YOUR_PASSWORD]
DB_NAME=postgres
DB_SSL=true
FRONTEND_URL=http://localhost:3000
```

If using **Local PostgreSQL**:
```env
DB_HOST=localhost
DB_PORT=5432
DB_NAME=wearcart
DB_USER=postgres
DB_PASSWORD=your_password
```

### Frontend (`frontend/.env.local`)

```env
NEXT_PUBLIC_API_URL=http://localhost:5000/api
NEXT_PUBLIC_WALLET_CONNECT_PROJECT_ID=[YOUR_ID_FROM_WALLETCONNECT_CLOUD]
```

## 3. Running the App

Run these commands in separate terminals:

**Backend:**
```bash
cd backend
# Seed database (First time only)
npm run seed
# Start Server
npm run dev
```

**Frontend:**
```bash
cd frontend
npm run dev
```

Access the app at: `http://localhost:3000`

---

## 4. Common Errors & Fixes

### Database Connection Failed
- **"database does not exist"**: Ensure `DB_NAME` is correct (`postgres` for Supabase default, `wearcart` for local).
- **"ENOTFOUND"**: Check your `DB_HOST`. For Vercel, use the **Supabase Transaction Pooler** host, not the direct connection.
- **"SSL/TLS error"**: Ensure `DB_SSL=true` is set for Supabase.

### Web3 / Wallet Issues
- **"Project ID missing"**: Get a free Project ID from [WalletConnect Cloud](https://cloud.walletconnect.com/) and add it to `frontend/.env.local` as `NEXT_PUBLIC_WALLET_CONNECT_PROJECT_ID`.

### Vercel Deployment
- **Backend API fails**: Ensure you added `DB_HOST`, `DB_PASSWORD`, etc., to Vercel Environment Variables.
- **Frontend can't reach Backend**: Ensure `NEXT_PUBLIC_API_URL` in Frontend Vercel Env Vars points to your deployed Backend URL (e.g., `https://wearcart-backend.vercel.app/api`).

