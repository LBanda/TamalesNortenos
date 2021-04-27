const nuevoCliente = require('../models/clientes.js');

exports.get = (request, response, next) => {
    response.render('paginaInicio');
};

exports.getRegistro = (request, response, next) => {
    response.render('registro01');
};
exports.getRegistro02 = (request, response, next) => {
    response.render('registro02');
};
exports.postRegistro02 = (request, response, next) => {
    console.log(request.body);
    const cliente = new nuevoCliente(1612, request.body.nombre, request.body.apellidos, request.body.telefono, request.body.direccion, request.body.referencia, request.body.email, 18);
    console.log(cliente);
    cliente.save()
        .then(() => {
            response.render('registro03');
        })
        .catch(err => console.log(err));
};