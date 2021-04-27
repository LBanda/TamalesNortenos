const express = require('express');

const router = express.Router();
path = require('path')

router.use('/css', express.static(path.join(__dirname, 'public/css')));
router.use('/js', express.static(path.join(__dirname, 'public/js')));
router.use('/img', express.static(path.join(__dirname, 'public/img')));

const tamalesController = require('../controllers/tamales-controller');

router.get('/', tamalesController.get);
router.get('/registro', tamalesController.getRegistro);
router.get('/registro02', tamalesController.getRegistro02);
router.post('/registro02', tamalesController.postRegistro02);

module.exports = router;