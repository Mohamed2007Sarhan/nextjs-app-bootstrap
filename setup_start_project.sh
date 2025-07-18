#!/bin/bash

# Damietta Furniture Marketplace Setup Script
# This script sets up the development environment for the Damietta furniture marketplace

set -e

echo "🪑 Setting up Damietta Furniture Marketplace..."
echo "=============================================="

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

print_error() {
    echo -e "${RED}❌ $1${NC}"
}

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    print_error "Node.js is not installed. Please install Node.js 18+ first."
    exit 1
fi

# Check Node.js version
NODE_VERSION=$(node --version | cut -d'v' -f2)
print_status "Node.js version: $NODE_VERSION"

# Check if npm is installed
if ! command -v npm &> /dev/null; then
    print_error "npm is not installed. Please install npm first."
    exit 1
fi

# Check if MongoDB is running
print_status "Checking MongoDB connection..."
if ! command -v mongod &> /dev/null && ! command -v mongosh &> /dev/null; then
    print_warning "MongoDB is not installed. Please install MongoDB and start the service."
    print_warning "Installation guide: https://docs.mongodb.com/manual/installation/"
    echo ""
    print_warning "For development, you can use MongoDB Atlas (cloud) instead:"
    print_warning "1. Go to https://www.mongodb.com/atlas"
    print_warning "2. Create a free cluster"
    print_warning "3. Get your connection string"
    print_warning "4. Update MONGODB_URI in .env.local"
fi

# Create .env.local if it doesn't exist
if [ ! -f .env.local ]; then
    print_status "Creating .env.local file..."
    cat > .env.local << EOF
# Database
MONGODB_URI=mongodb://localhost:27017/damietta-furniture

# Authentication
NEXTAUTH_URL=http://localhost:3000
NEXTAUTH_SECRET=your-secret-key-change-this-in-production

# JWT
JWT_SECRET=your-jwt-secret-change-this-in-production

# Cloud Storage (Optional - for production)
CLOUDINARY_CLOUD_NAME=your-cloud-name
CLOUDINARY_API_KEY=your-api-key
CLOUDINARY_API_SECRET=your-api-secret

# AWS S3 (Optional - for production)
AWS_ACCESS_KEY_ID=your-access-key
AWS_SECRET_ACCESS_KEY=your-secret-key
AWS_REGION=us-east-1
AWS_S3_BUCKET_NAME=damietta-furniture-models

# Payment (Optional - for production)
STRIPE_PUBLISHABLE_KEY=your-stripe-publishable-key
STRIPE_SECRET_KEY=your-stripe-secret-key
PAYMOB_API_KEY=your-paymob-api-key

# Email (Optional - for production)
SENDGRID_API_KEY=your-sendgrid-api-key
FROM_EMAIL=noreply@damietta-furniture.com

# SMS (Optional - for production)
TWILIO_ACCOUNT_SID=your-twilio-sid
TWILIO_AUTH_TOKEN=your-twilio-token
TWILIO_PHONE_NUMBER=your-twilio-number
EOF
    print_status ".env.local created successfully!"
    print_warning "Please update the environment variables in .env.local before running the project"
else
    print_status ".env.local already exists"
fi

# Install dependencies
print_status "Installing dependencies..."
npm install

# Check if Next.js is properly configured
print_status "Checking Next.js configuration..."
if [ ! -f next.config.ts ]; then
    print_warning "next.config.ts not found, using default configuration"
fi

# Create necessary directories
print_status "Creating project directories..."
mkdir -p public/models
mkdir -p public/images
mkdir -p uploads/temp

# Set permissions
chmod 755 setup_start_project.sh

# Build the project
print_status "Building the project..."
npm run build

# Start MongoDB (if installed locally)
if command -v mongod &> /dev/null; then
    print_status "Starting MongoDB..."
    if pgrep mongod > /dev/null; then
        print_status "MongoDB is already running"
    else
        print_warning "Please start MongoDB manually: mongod --dbpath /path/to/data"
    fi
fi

# Final instructions
echo ""
echo "🎉 Setup complete!"
echo "=================="
echo ""
echo "To start the development server:"
echo "1. Make sure MongoDB is running"
echo "2. Update .env.local with your configuration"
echo "3. Run: npm run dev"
echo ""
echo "The application will be available at: http://localhost:3000"
echo ""
echo "For production deployment:"
echo "1. Update all environment variables"
echo "2. Run: npm run build"
echo "3. Run: npm start"
echo ""
echo "Database setup:"
echo "- Local MongoDB: mongodb://localhost:27017/damietta-furniture"
echo "- MongoDB Atlas: Update MONGODB_URI in .env.local"
echo ""
echo "Happy coding! 🚀"
