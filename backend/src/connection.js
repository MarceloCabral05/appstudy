const { Sequelize } = require('sequelize');

//5432 o 5434 
const sequelize = new Sequelize("test", 'postgres', '1346', {
    host : 'localhost',
    port : 5432,
    dialect : 'postgres'
});

const testConnection = () => {
    try {
        sequelize.authenticate();
        console.log("Conectado con Exito!");
    } catch (error) {
        console.log("Error de conexion", error);
    }
}

testConnection();

module.exports = {
    Sequelize,
    sequelize
}