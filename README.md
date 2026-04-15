# 🧠 Ahkili — Mental Health Community Platform

**Ahkili** is a full-stack mental health community platform that allows users to share experiences, join support communities, interact with verified medical professionals, and access crisis hotlines — all in a safe, moderated environment.

---

## 📁 Project Structure

```
Ahkili_v3/
├── ahkili-backend/          # FastAPI Python backend
│   ├── app/
│   │   ├── main.py          # App entry point & middleware
│   │   ├── models.py        # SQLAlchemy database models
│   │   ├── schemas.py       # Pydantic request/response schemas
│   │   ├── crud.py          # Database operations
│   │   ├── database.py      # DB connection & session management
│   │   ├── routes/          # API route handlers
│   │   │   ├── users.py
│   │   │   ├── posts.py
│   │   │   ├── comments.py
│   │   │   ├── communities.py
│   │   │   ├── reactions.py
│   │   │   ├── comment_reactions.py
│   │   │   ├── notification.py
│   │   │   ├── upload.py
│   │   │   ├── verification.py
│   │   │   └── admin.py
│   │   └── services/
│   │       └── upload.py    # Cloudinary integration
│   ├── requirements.txt
│   ├── .env                 # Environment variables (not committed)
│   └── Procfile             # For Railway deployment
│
└── ahkili-frontend/         # React.js frontend
    ├── src/
    │   ├── pages/           # Route-level page components
    │   ├── components/      # Reusable UI components
    │   ├── services/        # API client & Firebase
    │   ├── context/         # Auth & Toast React contexts
    │   ├── hooks/           # Custom React hooks
    │   ├── locales/         # i18n translations (ar, en, fr)
    │   └── App.js
    ├── public/
    ├── package.json
    └── tailwind.config.js
```

---

## ✨ Features

- 🔐 **Firebase Authentication** — Email/password + Google sign-in
- 👥 **Communities** — Create, join, and moderate topic-based communities
- 📝 **Posts & Comments** — Rich threaded discussions with reactions
- 🩺 **Doctor Verification** — Verified medical professionals badge system
- 🔔 **Notifications** — Real-time in-app notification system
- 📞 **Hotlines** — Crisis support hotline directory by country
- 🛡️ **Admin Dashboard** — Content moderation & user management
- 📷 **Media Uploads** — Image and video support via Cloudinary
- 🌍 **Multilingual** — Arabic, English, and French (i18n)
- 📱 **PWA-ready** — Installable as a mobile app

---

## 🛠️ Tech Stack

| Layer       | Technology                                |
|-------------|-------------------------------------------|
| Frontend    | React 19, Tailwind CSS, React Router v7   |
| State Mgmt  | React Context, TanStack Query             |
| Auth        | Firebase Authentication                   |
| Backend     | FastAPI (Python 3.13)                     |
| Database    | PostgreSQL (Railway) / SQLite (local dev) |
| ORM         | SQLAlchemy 2.0                            |
| Validation  | Pydantic v2                               |
| Media       | Cloudinary                                |
| Deployment  | Vercel (frontend) + Railway (backend)     |

---

## 🚀 Getting Started

### Prerequisites

- Python 3.10+
- Node.js 18+
- A PostgreSQL database (or use the built-in SQLite for local dev)
- A Firebase project (for authentication)
- A Cloudinary account (for image/video uploads)

---

### 1. Clone the Repository

```bash
git clone https://github.com/YOUR_USERNAME/Ahkili_v3.git
cd Ahkili_v3
```

---

### 2. Backend Setup

```bash
cd ahkili-backend

# Create and activate a virtual environment
python -m venv venv

# Windows
venv\Scripts\activate

# macOS / Linux
source venv/bin/activate

# Install dependencies
pip install -r requirements.txt
```

#### Configure Environment Variables

Create a `.env` file in `ahkili-backend/`:

```env
# Database — use PostgreSQL URL or leave empty to use local SQLite
DATABASE_URL=postgresql://user:password@host:port/dbname

# Cloudinary (for media uploads)
CLOUDINARY_CLOUD_NAME=your_cloud_name
CLOUDINARY_API_KEY=your_api_key
CLOUDINARY_API_SECRET=your_api_secret

# Allowed frontend origins (comma-separated)
ALLOWED_ORIGINS=http://localhost:3000
```

> **Local dev tip:** If you skip `DATABASE_URL`, the app automatically uses a local SQLite file (`ahkili.db`). No database setup needed!

#### Run the Backend

```bash
uvicorn app.main:app --reload
```

The API will be available at `http://127.0.0.1:8000`  
Interactive docs: `http://127.0.0.1:8000/docs`

---

### 3. Frontend Setup

```bash
cd ../ahkili-frontend

# Install dependencies
npm install
```

#### Configure Environment Variables

Create a `.env.local` file in `ahkili-frontend/`:

```env
# Backend API URL
REACT_APP_API_URL=http://127.0.0.1:8000

# Firebase config (get these from Firebase Console > Project Settings)
REACT_APP_FIREBASE_API_KEY=your_api_key
REACT_APP_FIREBASE_AUTH_DOMAIN=your_project.firebaseapp.com
REACT_APP_FIREBASE_PROJECT_ID=your_project_id
REACT_APP_FIREBASE_STORAGE_BUCKET=your_project.appspot.com
REACT_APP_FIREBASE_MESSAGING_SENDER_ID=your_sender_id
REACT_APP_FIREBASE_APP_ID=your_app_id
```

> **Note:** The Firebase config is currently hardcoded in `src/services/firebase.js`. Moving it to environment variables is recommended before production.

#### Run the Frontend

```bash
npm start
```

The app will open at `http://localhost:3000`

---

### 4. (Optional) Seed Sample Data

```bash
cd ahkili-backend

# Initialize the database and seed communities
python init_db.py
python seed_communities.py
python seed_data.py
```

---

## 🗄️ Database Models

The platform uses the following core models:

- **User** — Firebase-authenticated users with roles (user / admin)
- **Community** — Topic-based groups with moderators
- **Post** — User-created posts (supports anonymous posting)
- **Comment** — Nested/threaded comments
- **PostReaction / CommentReaction** — Like/dislike reactions
- **DoctorVerification** — Verification requests for medical professionals
- **Notification / NotificationPreference** — In-app notification system
- **Report / ModerationLog** — Content moderation tracking
- **Hotline** — Crisis support phone directory

---

## 🌐 API Endpoints Overview

| Resource       | Base Path            |
|----------------|----------------------|
| Users          | `/users/`            |
| Posts          | `/posts/`            |
| Comments       | `/comments/`         |
| Communities    | `/communities/`      |
| Reactions      | `/reactions/`        |
| Notifications  | `/notification/`     |
| Uploads        | `/upload/`           |
| Verification   | `/verification/`     |
| Admin          | `/admin/`            |

Full interactive documentation available at `/docs` when the backend is running.

---

## 🚢 Deployment

### Backend — Railway

1. Push the `ahkili-backend` folder to a GitHub repo
2. Create a new Railway project and connect the repo
3. Add a PostgreSQL service in Railway
4. Set the environment variables (`DATABASE_URL`, `CLOUDINARY_*`, `ALLOWED_ORIGINS`)
5. Railway will auto-deploy using the `Procfile`

### Frontend — Vercel

1. Push the `ahkili-frontend` folder (or the full monorepo) to GitHub
2. Import the project in Vercel, set root directory to `ahkili-frontend`
3. Add environment variables (`REACT_APP_API_URL`, Firebase vars)
4. Vercel will auto-build and deploy

---

## 🔒 Environment Files & Security

| File | Committed? | Notes |
|------|------------|-------|
| `ahkili-backend/.env` | ❌ No | Contains DB credentials — keep private |
| `ahkili-frontend/.env.local` | ❌ No | Firebase config — keep private |
| `ahkili-frontend/.env.production` | ⚠️ Partial | Review before committing |

---

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/your-feature`
3. Commit your changes: `git commit -m "feat: add your feature"`
4. Push the branch: `git push origin feature/your-feature`
5. Open a Pull Request

---

## 📄 License

This project is for educational and research purposes.

---

## 📬 Contact

Built with ❤️ for mental health support.  
Questions? Open an issue or reach out via the repository.
