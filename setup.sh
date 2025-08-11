#!/bin/bash

# CORS Proxy Server Setup Script

echo "🚀 Setting up CORS Proxy Server..."

# Check if Python 3 is installed
if ! command -v python3 &> /dev/null; then
    echo "❌ Python 3 is not installed. Please install Python 3.9 or later."
    exit 1
fi

# Create virtual environment
echo "📦 Creating virtual environment..."
python3 -m venv venv

# Activate virtual environment
echo "🔧 Activating virtual environment..."
source venv/bin/activate

# Install dependencies
echo "📥 Installing dependencies..."
pip install -r requirements.txt

echo "✅ Setup complete!"
echo ""
echo "🎯 To run the server:"
echo "   source venv/bin/activate"
echo "   python api_proxy_server.py --port 8081"
echo ""
echo "🌐 Server will be available at: http://localhost:8081"
echo "📋 Make sure to update API_BASE_URL in api_proxy_server.py"
