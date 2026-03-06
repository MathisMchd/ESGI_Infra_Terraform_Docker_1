require('dotenv').config();
const express = require('express');

const app = express();

// Configuration
const PORT = process.env.PORT || 3000;
const APP_ENV = process.env.APP_ENV || 'development';
const DATABASE_URL = process.env.DATABASE_URL;

// Routes
app.get('/health', (req, res) => {
  res.status(200).json({ status: 'ok' });
});

app.get('/', (req, res) => {
  res.status(200).json({
    message: 'API running',
    environment: APP_ENV,
    databaseConfigured: !!DATABASE_URL
  });
});

// Démarrage du serveur
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT} (${APP_ENV} environment)`);
  if (DATABASE_URL) {
    console.log(`Database URL is configured`);
  } else {
    console.log(`⚠ No DATABASE_URL provided`);
  }
});
