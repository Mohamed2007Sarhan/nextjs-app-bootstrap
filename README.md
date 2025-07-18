# Damietta Furniture Marketplace 🪑

A large-scale, full-stack B2C furniture marketplace tailored for the Damietta furniture industry using ReactJS and Next.js with App Router.

## 🚀 Quick Start

### Prerequisites
- Node.js 18+ 
- MongoDB (local or MongoDB Atlas)
- npm or yarn

### Setup & Run

```bash
# Make the setup script executable and run it
chmod +x setup_start_project.sh
./setup_start_project.sh

# Or manually:
npm install
npm run dev
```

## 📁 Project Structure

```
damietta-furniture-marketplace/
├── src/
│   ├── app/
│   │   ├── api/
│   │   │   └── auth/[...nextauth]/route.ts
│   │   ├── (marketplace)/
│   │   ├── (workshop)/
│   │   └── (admin)/
│   ├── components/
│   ├── lib/
│   │   ├── db/
│   │   │   ├── config.ts
│   │   │   └── models/
│   │   ├── auth/
│   │   └── utils.ts
│   └── types/
├── public/
├── .env.local
├── setup_start_project.sh
└── README.md
```

## 🏗️ Architecture Overview

### Database Models
- **User**: Customer, Workshop, Admin roles
- **Product**: 3D models, pricing, specifications
- **Category**: Hierarchical product categories
- **Order**: Complete order management
- **Review**: Product reviews and ratings

### Features Ready
- ✅ Authentication system (NextAuth.js)
- ✅ Database models (MongoDB/Mongoose)
- ✅ TypeScript configuration
- ✅ Environment setup
- ✅ Utility functions

### Next Steps
1. API routes implementation
2. Frontend components
3. 3D/AR features
4. Payment integration
5. Admin dashboard

## 🔧 Environment Variables

Copy `.env.local` and configure:

```bash
# Database
MONGODB_URI=mongodb://localhost:27017/damietta-furniture

# Authentication
NEXTAUTH_URL=http://localhost:3000
NEXTAUTH_SECRET=your-secret-key

# Cloud Storage (optional)
CLOUDINARY_CLOUD_NAME=your-cloud-name
AWS_ACCESS_KEY_ID=your-access-key

# Payment (optional)
STRIPE_SECRET_KEY=your-stripe-key
```

## 🛠️ Development Commands

```bash
npm run dev          # Start development server
npm run build        # Build for production
npm run start        # Start production server
npm run lint         # Run ESLint
```

## 🎯 Key Features

- **Workshop to Consumer Marketplace**
- **3D Product Previews** (Three.js/React-Three-Fiber)
- **AR/VR Support** for furniture placement
- **Multilingual** (Arabic & English)
- **Payment Integration** (Stripe, Paymob)
- **Role-based Access** (Customer, Workshop, Admin)
- **PWA Ready** with offline support

## 📞 Support

For issues or questions:
1. Check the setup script: `./setup_start_project.sh`
2. Ensure MongoDB is running
3. Verify environment variables in `.env.local`

## 🚀 Ready to Build!

The foundation is complete. Start building:
1. API routes
2. Frontend components
3. 3D viewer
4. Admin dashboard
