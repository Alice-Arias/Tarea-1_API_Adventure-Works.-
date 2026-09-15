require('dotenv').config();
const express = require('express');
const cors = require('cors');
const departamentosRoutes = require('./routes/departamentos');
 
const app = express();
const PORT = process.env.PORT || 3000;
 
app.use(cors());
app.use(express.json());
 
// Todas las rutas del CRUD viven bajo /api
app.use('/api', departamentosRoutes);
 
// Ruta de salud, para comprobar rapido que el servidor esta vivo
app.get('/', (req, res) => {
  res.json({ mensaje: 'API AdventureWorks corriendo correctamente.' });
});
 
app.listen(PORT, () => {
  console.log(`Servidor escuchando en http://localhost:${PORT}`);
});
