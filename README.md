# Tech Essentials E-Commerce Store

A modern, full-stack e-commerce application built with React, TypeScript, and Lovable Cloud (Supabase). This demo showcases a complete shopping cart experience with a beautiful UI and robust backend.

![Tech Stack](https://img.shields.io/badge/React-18.3.1-blue)
![TypeScript](https://img.shields.io/badge/TypeScript-5.x-blue)
![Tailwind CSS](https://img.shields.io/badge/Tailwind-3.x-blue)
![Lovable Cloud](https://img.shields.io/badge/Backend-Lovable_Cloud-purple)

## ✨ Features

- **Product Catalog**: Browse premium tech products with beautiful product cards
- **Shopping Cart**: Add, remove, and manage items with real-time updates
- **Persistent Cart**: Cart data stored in backend database across sessions
- **Checkout Flow**: Complete order processing with form validation
- **Order Confirmation**: Receipt page with order summary
- **Responsive Design**: Mobile-first design that works on all devices
- **Modern UI**: Built with shadcn/ui components and custom design system
- **SEO Optimized**: Proper meta tags and semantic HTML structure

## 🛠️ Tech Stack

### Frontend
- **React 18** - UI library
- **TypeScript** - Type safety
- **Vite** - Build tool and dev server
- **React Router** - Client-side routing
- **Tailwind CSS** - Utility-first styling
- **shadcn/ui** - Component library
- **Lucide React** - Icon library
- **React Hook Form** - Form handling
- **Zod** - Schema validation
- **TanStack Query** - Data fetching and caching

### Backend (Lovable Cloud)
- **PostgreSQL** - Database
- **REST API** - Auto-generated from database schema
- **Row Level Security** - Data access policies

## 📋 Prerequisites

- Node.js 18+ and npm
- Git

## 🚀 Quick Start

### 1. Clone the Repository

```bash
git clone <YOUR_GIT_URL>
cd <YOUR_PROJECT_NAME>
```

### 2. Install Dependencies

```bash
npm install
```

### 3. Environment Variables

Create a `.env` file in the root directory (or use the existing one):

```env
VITE_SUPABASE_URL=your_supabase_url
VITE_SUPABASE_PUBLISHABLE_KEY=your_supabase_anon_key
VITE_SUPABASE_PROJECT_ID=your_project_id
```

> **Note**: If you cloned this from a Lovable project, the `.env` file is automatically generated and managed.

### 4. Start Development Server

```bash
npm run dev
```

The app will be available at `http://localhost:8080`

## 📁 Project Structure

```
├── src/
│   ├── assets/              # Product images
│   ├── components/          # React components
│   │   ├── ui/             # shadcn/ui components
│   │   ├── Header.tsx      # Navigation header
│   │   └── ProductCard.tsx # Product display card
│   ├── hooks/              # Custom React hooks
│   │   └── useCart.ts      # Cart state management
│   ├── integrations/       # External service integrations
│   │   └── supabase/       # Database client & types
│   ├── pages/              # Route pages
│   │   ├── Products.tsx    # Product listing
│   │   ├── Cart.tsx        # Shopping cart
│   │   ├── Checkout.tsx    # Checkout form
│   │   └── Receipt.tsx     # Order confirmation
│   ├── types/              # TypeScript type definitions
│   ├── App.tsx             # Main app component
│   └── index.css           # Global styles & design tokens
├── supabase/
│   └── migrations/         # Database migrations
└── tailwind.config.ts      # Tailwind configuration
```

## 🗄️ Database Schema

### Products Table
- `id` - UUID primary key
- `name` - Product name
- `description` - Product description
- `price` - Decimal price
- `image_url` - Product image path
- `stock` - Available quantity
- `category` - Product category

### Cart Items Table
- `id` - UUID primary key
- `session_id` - User session identifier
- `product_id` - Foreign key to products
- `quantity` - Item quantity
- `created_at` - Timestamp

### Orders Table
- `id` - UUID primary key
- `session_id` - User session identifier
- `customer_name` - Buyer name
- `customer_email` - Buyer email
- `customer_address` - Delivery address
- `total_amount` - Order total
- `status` - Order status
- `created_at` - Timestamp

## 🎨 Design System

The app uses a custom design system with semantic color tokens defined in `src/index.css`:

- **Primary Colors**: Brand colors for CTAs and accents
- **Secondary Colors**: Supporting UI elements
- **Semantic Tokens**: Background, foreground, muted, accent, destructive
- **Gradients**: Custom gradient definitions
- **Typography**: Consistent font scale and weights

## 🔧 Available Scripts

```bash
npm run dev          # Start development server
npm run build        # Build for production
npm run preview      # Preview production build
npm run lint         # Run ESLint
```

## 🌐 Deployment

This project is built with Lovable and can be deployed easily:

1. **Via Lovable**: Click the "Publish" button in the Lovable editor
2. **Custom Domain**: Connect your domain in Project Settings → Domains
3. **Manual Deploy**: Build and deploy the `dist` folder to any static hosting service

## 📱 Features In Detail

### Shopping Cart Management
- Add/remove items with quantity controls
- Real-time price calculations
- Persistent cart across page refreshes
- Empty cart state handling

### Product Catalog
- Grid layout with responsive columns
- Product images, names, descriptions, and prices
- Stock availability display
- Category filtering (future enhancement)

### Checkout Process
- Form validation with Zod schemas
- Customer information collection
- Address input
- Order summary display
- Success confirmation page

## 🔐 Security

- Row Level Security (RLS) policies on all tables
- Server-side data validation
- Secure session management
- Protected database operations

## 🤝 Contributing

This is a demo project created with Lovable. Feel free to fork and customize for your needs!

## 📄 License

MIT License - feel free to use this project for learning or as a starting point for your own e-commerce application.

## 🆘 Support

- [Lovable Documentation](https://docs.lovable.dev/)
- [Lovable Discord Community](https://discord.com/channels/1119885301872070706/1280461670979993613)
- [GitHub Issues](../../issues)

## 🎯 Future Enhancements

- User authentication
- Product search and filtering
- Payment gateway integration
- Order tracking
- Product reviews and ratings
- Wishlist functionality
- Admin dashboard
- Email notifications

---

Built with ❤️ using [Lovable](https://lovable.dev)