# CORS Proxy Server for Flutter Web Apps

A Python-based CORS proxy server that enables Flutter web applications deployed to GitHub Pages to communicate with APIs that don't support CORS.

## 🚀 Features

- **CORS Handling**: Adds proper CORS headers to enable cross-origin requests
- **API Proxying**: Forwards requests to any API while handling CORS restrictions  
- **Flutter Web Serving**: Can serve Flutter web apps with SPA routing support
- **Authorization Support**: Preserves Authorization headers and request bodies
- **Error Handling**: Comprehensive error handling with proper HTTP status codes
- **Easy Deployment**: Ready for Railway, Heroku, Vercel deployment
- **Development Friendly**: Detailed logging and local development support

## 🛠 Use Case

**Problem**: Flutter web apps deployed to GitHub Pages cannot make API calls to external services due to CORS restrictions.

**Solution**: Deploy this proxy server to a service like Railway, then configure your Flutter app to make API calls through the proxy instead of directly to the API.

```
Flutter Web App (GitHub Pages) → CORS Proxy Server → External API
```

## 📁 Files

- `api_proxy_server.py` - Main Python server with CORS and proxy functionality
- `requirements.txt` - Python dependencies
- `Procfile` - Process configuration for Heroku/Railway
- `runtime.txt` - Python version specification  
- `railway.toml` - Railway deployment configuration
- `DEPLOYMENT.md` - Detailed deployment instructions

## 🔧 Configuration

Update the `API_BASE_URL` in `api_proxy_server.py` to point to your target API:

```python
API_BASE_URL = "https://your-api-server.com"
```

## 🚀 Quick Deploy

### Railway (Recommended)
1. Fork/clone this repository
2. Go to [Railway](https://railway.app)
3. Click "Deploy from GitHub repo"
4. Select this repository
5. Railway auto-detects Python and deploys using the configuration files

### Heroku
```bash
heroku create your-proxy-name
git push heroku main
```

### Local Development
```bash
python api_proxy_server.py --port 8081
```

## 📱 Usage with Flutter

After deploying, update your Flutter app's API base URL:

```dart
// Before (causes CORS errors from GitHub Pages)
static const String baseUrl = 'https://your-api.com';

// After (works from GitHub Pages)  
static const String baseUrl = 'https://your-proxy.railway.app';
```

## 🔍 API Endpoints Supported

The server proxies these endpoints by default:
- `/api/v1/auth/apple/generate-account` (POST)
- `/api/v1/payments/generate-and-save-braintree-client-token` (GET)
- `/api/v1/payments/add-payment-method` (POST)
- `/api/v1/payments/subscription/create-subscription-transaction-v2` (POST)
- `/api/v1/payments/rent-power-bank` (POST)

## 🛡 CORS Headers Added

```http
Access-Control-Allow-Origin: *
Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS  
Access-Control-Allow-Headers: Content-Type, Authorization, X-Requested-With
Access-Control-Max-Age: 86400
```

## 📋 Environment Variables

- `PORT` - Server port (default: 8081)
- `WEB_DIR` - Directory to serve web files (default: build/web)

## 🐛 Debugging

The server provides detailed logging:
- 🔄 Request proxying
- 📦 Request data
- ✅ Successful responses  
- ❌ Error details

## 📄 License

MIT License - feel free to use for your projects.

## 🤝 Contributing

Issues and pull requests welcome!
