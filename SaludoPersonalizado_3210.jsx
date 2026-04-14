import React from 'react';

/**
 * Componente de saludo personalizado
 * @param {Object} props - Las propiedades del componente
 * @param {string} props.nombre - El nombre de la persona a saludar
 * @param {string} [props.saludo='Hola'] - El tipo de saludo (opcional, por defecto 'Hola')
 */
function SaludoPersonalizado({ nombre, saludo = 'Hola' }) {
  return (
    <div style={{ padding: '20px', fontFamily: 'Arial, sans-serif' }}>
      <h1>{saludo}, {nombre}!</h1>
      <p>¡Bienvenido/a!</p>
    </div>
  );
}

export default SaludoPersonalizado;
