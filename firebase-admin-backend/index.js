const admin = require('firebase-admin');
const express = require('express');
const bodyParser = require('body-parser');

const serviceAccount = require('./serviceAccountKey.json');

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount)
});

const db = admin.firestore();

const app = express();
app.use(bodyParser.json());

// Function to add a new banner card
app.post('/add-banner-card', async (req, res) => {
  const bannerCard = req.body;
  try {
    const docRef = await db.collection('bannerCards').add(bannerCard);
    res.status(200).send(`Added banner card with ID: ${docRef.id}`);
  } catch (error) {
    res.status(500).send(`Error adding banner card: ${error}`);
  }
});

// Function to update an existing banner card
app.put('/update-banner-card/:id', async (req, res) => {
  const bannerCard = req.body;
  const id = req.params.id;
  try {
    await db.collection('bannerCards').doc(id).update(bannerCard);
    res.status(200).send(`Updated banner card with ID: ${id}`);
  } catch (error) {
    res.status(500).send(`Error updating banner card: ${error}`);
  }
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
