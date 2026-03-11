# Hishab Pro 💼

Hishab Pro হলো একটি modern, responsive, and secure **Expense Tracker Web App** যেখানে ব্যবহারকারী নিজের **আয়-ব্যয়**, **নোটস**, **মাসিক বাজেট**, এবং **category-wise expense analysis** এক জায়গা থেকে পরিচালনা করতে পারে।

এই project-এ ব্যবহার করা হয়েছে:

- **HTML + Tailwind CSS**
- **Supabase Auth + Database**
- **Chart.js**
- **SweetAlert2**
- **jsPDF + CSV Export**
- **Vercel Deployment Ready**

---

## ✨ Features

### 🔐 Authentication
- Login / Signup system
- Supabase Auth integration
- Session persistence
- Secure user ভিত্তিক data access

### 💸 Transaction Management
- আয় এবং ব্যয় add করা
- Edit / Delete transaction
- Category selection with icons
- Date-based filtering

### 📊 Dashboard
- Total Income
- Total Expense
- Current Balance
- Monthly Budget Summary
- Recent Transactions
- Doughnut Chart by Expense Category

### 🎯 Budgeting
- মাসিক বাজেট set করা
- Expense vs Budget progress bar
- Budget warning status

### 📝 Notes
- Personal notes add করা
- Saved notes view করা
- Notes delete করা

### 📁 Export
- Transaction list as **CSV**
- Transaction list as **PDF**

### 🌗 Theme
- Dark / Light mode toggle

### 📱 UI / UX
- Mobile responsive design
- Glassmorphism style dashboard
- Sidebar navigation
- Smooth card-based layout

---

## 🛠️ Tech Stack

- **Frontend:** HTML, Tailwind CSS, Vanilla JavaScript
- **Database:** Supabase PostgreSQL
- **Authentication:** Supabase Auth
- **Chart Library:** Chart.js
- **Alerts:** SweetAlert2
- **Export:** jsPDF, CSV
- **Deployment:** Vercel

---

## 📂 Project Structure

```txt
hishab-pro/
├── index.html
├── supabase_schema.sql
└── vercel.json
