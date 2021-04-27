const db = require('../util/database');

module.exports = class nuevoCliente {

    //Constructor de la clase. Sirve para crear un nuevo objeto, y en él se definen las propiedades del modelo
    constructor(idCliente, nombre, apellidos, telefono, direccion, referencia, email, idDistribucion) {
        this.idCliente = idCliente;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.telefono = telefono;
        this.direccion = direccion;
        this.referencia = referencia;
        this.email = email;
        this.idDistribucion = idDistribucion;
        // this.password = password;
    }

    //Este método servirá para guardar de manera persistente el nuevo objeto. 
    save() {
        return db.execute('INSERT INTO cliente (idCliente, nombre, apellidos, telefono, direccion, referenciaDomicilio, correoElectronico, idDistribucion) VALUES (?, ?, ?, ?, ?, ?, ?, ?)',
            [this.idCliente, this.nombre, this.apellidos, this.telefono, this.direccion, this.referencia, this.email, this.idDistribucion]
        );
    }

    //Este método servirá para devolver los objetos del almacenamiento persistente.
    static fetchAll() {
        return db.execute('SELECT * FROM cliente');
    }

}