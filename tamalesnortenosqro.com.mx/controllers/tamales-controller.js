const nuevoCliente = require('../models/clientes.js');
const bcrypt = require('bcryptjs');

exports.get = (request, response, next) => {
    response.render('paginaInicio');
};

exports.getRegistro = (request, response, next) => {
    response.render('registro01');
};
exports.getRegistro02 = (request, response, next) => {
    response.render('registro02', {
        error: request.session.error !== undefined ? request.session.error : false,
        titulo: "Nuevo Cliente",
    });
};
exports.postRegistro02 = (request, response, next) => {
    const cliente = new nuevoCliente(request.body.nombre, request.body.apellidos, request.body.telefono, request.body.direccion, request.body.referencia, request.body.email, 8390, request.body.password);

    request.session.error = undefined;

    cliente.save()
        .then(() => {
            response.render('registro03');
        })
        .catch(err => {
            console.log(err);
            request.session.error = "Este correo electrónico ya está registrado";
            response.redirect('registro02');
        });
};

exports.logout = (request, response, next) => {
    request.session.destroy(() => {
        response.redirect('login'); //Este código se ejecuta cuando la sesión se elimina.
    });
};

exports.getLogin = (request, response, next) => {
    response.render('login', {
        error: request.session.error !== undefined ? request.session.error : false,
        titulo: "Iniciar sesion",
    });
};

let nombre;

exports.postLogin = (request, response, next) => {
    request.session.error = undefined;
    nuevoCliente.fetchOne(request.body.email)
        .then(([rows, fieldData]) => {
            nombre = rows[0].nombre;
            bcrypt.compare(request.body.password, rows[0].password)
                .then(doMatch => {
                    if (doMatch) {
                        request.session.isLoggedIn = true;
                        request.session.user = rows[0].nombre;
                        return request.session.save(err => {
                            response.redirect('/inicio');
                        });
                    }
                    request.session.error = "Usuario y/o contraseña incorrectos";
                    response.redirect('login');
                }).catch(err => {
                    request.session.error = "Usuario y/o contraseña incorrectos";
                    response.redirect('login');
                });
        }).catch(err => {
            console.log(err);
            request.session.error = "Usuario y/o contraseña incorrectos";
            response.redirect('login');
        });
};

exports.getInicio = (request, response, next) => {
    response.render('inicio', {
        usuario: nombre,
    });
};
exports.getCompra01 = (request, response, next) => {
    response.render('compra01', {
        usuario: nombre,
    });
};
exports.getCompra02 = (request, response, next) => {
    response.render('compra02', {
        usuario: nombre,
    });
};
// exports.postCompra02 = (request, response, next) => {
//     response.render('compra02', {
//         usuario: nombre,
//     });
// };
exports.getCompra03 = (request, response, next) => {
    response.render('compra03', {
        usuario: nombre,
    });
};

exports.getCompra04 = (request, response, next) => {
    response.render('compra04', {
        usuario: nombre,
    });
};