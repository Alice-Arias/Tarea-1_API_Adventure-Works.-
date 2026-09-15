const express = require('express');
const router = express.Router();
const { sql, getPool } = require('../db');

/* =========================================================================
   1. INSERT - Registrar un nuevo departamento
   POST /api/departamentos
   Body JSON: { "nombre": "Marketing", "grupo": "Administracion" }
   ========================================================================= */
router.post('/departamentos', async (req, res) => {
  const { nombre, grupo } = req.body;

  if (!nombre || !grupo) {
    return res.status(400).json({ error: 'nombre y grupo son obligatorios.' });
  }

  try {
    const pool = await getPool();
    const result = await pool
      .request()
      .input('Nombre', sql.NVarChar(40), nombre)
      .input('Grupo', sql.NVarChar(40), grupo)
      .execute('sp_InsertarDepartamento');

    res.status(201).json({
      mensaje: 'Departamento registrado correctamente.',
      info: result.returnValue,
    });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: err.message });
  }
});

/* =========================================================================
   2. UPDATE - Actualizar cantidad de inventario en una ubicacion
   PUT /api/inventario
   Body JSON: { "productId": 1, "locationId": 1, "nuevaCantidad": 100 }
   ========================================================================= */
router.put('/inventario', async (req, res) => {
  const { productId, locationId, nuevaCantidad } = req.body;

  if (productId == null || locationId == null || nuevaCantidad == null) {
    return res
      .status(400)
      .json({ error: 'productId, locationId y nuevaCantidad son obligatorios.' });
  }

  try {
    const pool = await getPool();
    await pool
      .request()
      .input('ProductID', sql.Int, productId)
      .input('LocationID', sql.SmallInt, locationId)
      .input('NuevaCantidad', sql.SmallInt, nuevaCantidad)
      .execute('sp_ActualizarCantidadInventarioUbicacion');

    res.json({ mensaje: 'Cantidad actualizada correctamente.' });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: err.message });
  }
});

/* =========================================================================
   3. DELETE - Eliminar un departamento
   DELETE /api/departamentos/:nombre
   ========================================================================= */
router.delete('/departamentos/:nombre', async (req, res) => {
  const { nombre } = req.params;

  try {
    const pool = await getPool();
    await pool
      .request()
      .input('nombre', sql.NVarChar(50), nombre)
      .execute('sp_eliminardepartamento');

    res.json({ mensaje: 'Departamento eliminado correctamente (si existia y no tenia dependencias).' });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: err.message });
  }
});

/* =========================================================================
   4. SELECT (una tabla) - Cantidad de clientes por territorio
   GET /api/clientes/territorio/:territoryId
   ========================================================================= */
router.get('/clientes/territorio/:territoryId', async (req, res) => {
  const { territoryId } = req.params;

  try {
    const pool = await getPool();
    const result = await pool
      .request()
      .input('territoryid', sql.Int, territoryId)
      .execute('sp_buscarclientesporterritorio');

    res.json(result.recordset);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: err.message });
  }
});

/* =========================================================================
   5. SELECT (con JOIN) - Personas por tipo
   GET /api/personas/tipo/:tipoPersona
   Ejemplo: /api/personas/tipo/empleado
   ========================================================================= */
router.get('/personas/tipo/:tipoPersona', async (req, res) => {
  const { tipoPersona } = req.params;

  try {
    const pool = await getPool();
    const result = await pool
      .request()
      .input('tipopersona', sql.VarChar(30), tipoPersona)
      .execute('sp_buscarpersonasportipo');

    res.json(result.recordset);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: err.message });
  }
});

/* =========================================================================
   6. BONUS - Reporte de Work Order (SELECT con JOIN + ROLLUP)
   GET /api/workorder/reporte
   ========================================================================= */
router.get('/workorder/reporte', async (req, res) => {
  try {
    const pool = await getPool();
    const result = await pool.request().execute('sp_consultarworkorder');

    res.json(result.recordset);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: err.message });
  }
});

module.exports = router;
