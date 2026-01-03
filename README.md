# WearCart - E-commerce System

# Demo Vieo - https://drive.google.com/file/d/1-MVuq8ZhpDC80TfP3JyuczfGQuAT1r13/view?usp=sharing

A comprehensive web-based clothing e-commerce system built with Next.js, PostgreSQL, and Express.

## Project Overview

WearCart is a cutting-edge **Hybrid E-commerce Platform** that bridges the gap between Web2 and Web3. It offers a traditional shopping experience with advanced features like crypto payments and smart contract integration.

## Features

### 🛍️ Customer Experience
- **Hybrid Payments**: Pay with Credit Card (Razorpay) OR Crypto (ETH/Sepolia).
- **Web3 Integration**: Connect Wallet (Metamask/Rainbow) to view balance and make blockchain purchases.
- **Smart Filters**: Browse products by category, type, and price.
- **Order Tracking**: View status of both traditional and blockchain transactions.

### 🔐 Admin Dashboard
- **Product Management**: Create, edit, and inventory control.
- **Sales Overview**: Track revenue from all sources.
- **Invoicing**: Automatic invoice generation for orders.

## Tech Stack

- **Frontend**: Next.js 14, React, Tailwind CSS, RainBowKit (Web3)
- **Backend**: Node.js, Express.js
- **Database**: PostgreSQL (via Supabase)
- **Smart Contract**: Solidity (Ethereum/Sepolia)
- **Deployment**: Vercel (Frontend & Backend)

## Project Structure

```
ApparelDesk/
├── backend/          # Express API + Database Logic
│   ├── config/       # DB Connection (Supabase/Local)
│   ├── models/       # Sequelize Models
│   └── routes/       # API Endpoints
├── frontend/         # Next.js App
│   ├── app/          # Pages & Routes
│   ├── components/   # UI Components
│   └── utils/        # Web3 & Helper functions
└── smart_contract/   # Solidity Contracts (if applicable)
```

## Quick Start

See [SETUP.md](./SETUP.md) for detailed installation and troubleshooting instructions.

### Prerequisites
- Node.js 18+
- Supabase Account
- WalletConnect Project ID

### Products
- `GET /api/products` - Get all products (with filters)
- `GET /api/products/:id` - Get single product
- `POST /api/products` - Create product (internal only)
- `PUT /api/products/:id` - Update product (internal only)
- `DELETE /api/products/:id` - Delete product (internal only)

### Sale Orders
- `POST /api/sale-orders` - Create sale order
- `GET /api/sale-orders` - Get all sale orders
- `GET /api/sale-orders/:id` - Get single sale order
- `POST /api/sale-orders/:id/invoice` - Create invoice from order

### Coupons
- `POST /api/coupons/validate` - Validate coupon code
- `GET /api/coupons` - Get all coupons (internal only)

## Features Implementation

### Automatic Stock Management
- Stock is automatically updated when purchase orders are confirmed
- Stock is automatically reduced when sale orders are confirmed

### Automatic Invoicing
- System setting controls automatic invoice generation
- When enabled, invoices are automatically created after website payment
- When disabled, invoices must be manually created in backend

### Payment Terms
- Support for early payment discounts
- Configurable discount percentage and days
- Discount can be applied on base amount or total amount

### Coupon Codes
- Contact-based restrictions
- Expiration date validation
- Linked to discount offers with date ranges
- Available on sales or website

## License

ISC

