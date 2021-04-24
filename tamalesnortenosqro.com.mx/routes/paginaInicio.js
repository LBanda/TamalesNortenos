const express = require('express');

const router = express.Router();
path = require('path')
router.use('/css', express.static(path.join(__dirname, 'public/css')));
router.use('/js', express.static(path.join(__dirname, 'public/js')));
router.use('/img', express.static(path.join(__dirname, 'public/img')));

const paginaInicioController = require('../controllers/paginaInicio-controller');

router.get('/', paginaInicioController.get);

module.exports = router;