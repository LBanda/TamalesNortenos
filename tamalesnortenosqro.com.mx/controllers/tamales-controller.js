const nuevoCliente = require('../models/clientes.js');
const nuevaDistribucion = require('../models/distribucion.js')
const nuevoProducto = require('../models/producto.js')
const bcrypt = require('bcryptjs');

exports.get = (request, response, next) => {
    nuevoProducto.fetchAll()
        .then(([rows, fieldData]) => {
            console.log(rows);
            response.render('paginaInicio', {
                productos: rows,
                titulo: "Nuestros Productos"
            });
        })
        .catch(err => console.log(err));
};

exports.getRegistro = (request, response, next) => {
    response.render('registro01');
};
exports.getRegistro02 = (request, response, next) => {
    nuevaDistribucion.fetchAll()
        .then(([rows, fieldData]) => {
            response.render('registro02', {
                distribuciones: rows,
                error: request.session.error !== undefined ? request.session.error : false,
                titulo: "Nuevo Cliente"
            });
        })
        .catch(err => console.log(err));

};
exports.postRegistro02 = (request, response, next) => {
    var colonia = request.body.colonia;
    var idColonia;
    switch (colonia) {
        case "Tejeda":
            idColonia = 8384;
            break;
        case "Jurica":
            idColonia = 8385;
            break;
        case "El Refugio":
            idColonia = 8386;
            break;
        case "Juriquilla":
            idColonia = 8387;
            break;
        case "La Vista":
            idColonia = 8388;
            break;
        case "Sonterra":
            idColonia = 8389;
            break;
        case "Balvanegra":
            idColonia = 8390;
            break;
        case "Zibata":
            idColonia = 8391;
            break;
        case "Campanario":
            idColonia = 8392;
            break;
        case "Cimatario":
            idColonia = 8393;
            break;
    }
    const cliente = new nuevoCliente(request.body.nombre, request.body.apellidos, request.body.telefono, request.body.direccion, request.body.referencia, request.body.email, idColonia, request.body.password);

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