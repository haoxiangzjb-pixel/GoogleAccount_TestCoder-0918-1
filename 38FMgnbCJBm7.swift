import Foundation

/// Protocolo para dispositivos conectables en Swift
protocol ConectableDevice {
    
    /// Nombre del dispositivo
    var nombre: String { get set }
    
    /// ID único del dispositivo
    var id: UUID { get }
    
    /// Estado de conexión actual
    var estaConectado: Bool { get set }
    
    /// Intenta conectar el dispositivo con las credenciales especificadas
    /// - Returns: True si la conexión fue exitosa, false en caso contrario
    func conectar() -> Bool
    
    /// Desconecta el dispositivo actualmente conectado
    func desconectar()
    
    /// Envía datos al dispositivo
    /// - Parameter datos: Datos a enviar
    /// - Returns: True si los datos fueron enviados exitosamente
    func enviarDatos(_ datos: Data) -> Bool
    
    /// Recibe datos del dispositivo
    /// - Returns: Datos recibidos o nil si no hay datos disponibles
    func recibirDatos() -> Data?
    
    /// Obtiene información del estado del dispositivo
    /// - Returns: Diccionario con información del dispositivo
    func obtenerEstado() -> [String: Any]
}

/// Extensión por defecto del protocolo ConectableDevice
extension ConectableDevice {
    
    func conectar() -> Bool {
        guard !estaConectado else {
            print("El dispositivo \(nombre) ya está conectado")
            return true
        }
        
        // Implementación predeterminada (debe ser sobrescrita)
        estaConectado = true
        print("Conectando dispositivo: \(nombre)")
        return true
    }
    
    func desconectar() {
        guard estaConectado else {
            print("El dispositivo \(nombre) no estaba conectado")
            return
        }
        
        estaConectado = false
        print("Desconectando dispositivo: \(nombre)")
    }
    
    func enviarDatos(_ datos: Data) -> Bool {
        guard estaConectado else {
            print("No se pueden enviar datos. El dispositivo \(nombre) no está conectado.")
            return false
        }
        
        print("Enviando \(datos.count) bytes al dispositivo \(nombre)")
        return true
    }
    
    func recibirDatos() -> Data? {
        guard estaConectado else {
            print("No se pueden recibir datos. El dispositivo \(nombre) no está conectado.")
            return nil
        }
        
        print("Recibiendo datos del dispositivo \(nombre)")
        return Data()
    }
    
    func obtenerEstado() -> [String: Any] {
        return [
            "id": id.uuidString,
            "nombre": nombre,
            "conectado": estaConectado,
            "tipo": type(of: self)
        ]
    }
}

// Ejemplo de implementación para un dispositivo IoT
struct DispositivoIoT: ConectableDevice {
    var nombre: String
    let id: UUID = UUID()
    var estaConectado: Bool = false
    var direccionIP: String
    var puerto: Int
    
    func conectar() -> Bool {
        guard !estaConectado else {
            print("El dispositivo \(nombre) ya está conectado")
            return true
        }
        
        // Simular proceso de conexión a IP y puerto
        print("Intentando conectar a \(direccionIP):\(puerto)...")
        
        // Aquí iría la lógica real de conexión
        Thread.sleep(forTimeInterval: 0.5)
        
        estaConectado = true
        print("Conexión establecida con éxito!")
        return true
    }
    
    override func recibirDatos() -> Data? {
        guard estaConectado else {
            return nil
        }
        
        // Simular recepción de datos del sensor
        let mensaje = "Lectura del sensor: \(Date())"
        return mensaje.data(using: .utf8)
    }
}

// Ejemplo de uso
let sensorTemperatura = DispositivoIoT(
    nombre: "Sensor Temp 01",
    direccionIP: "192.168.1.100",
    puerto: 8080
)

sensorTemperatura.conectar()
if let datos = sensorTemperatura.recibirDatos() {
    print("Datos recibidos: \(String(data: datos, encoding: .utf8) ?? "Inválidos")")
}
print("Estado: \(sensorTemperatura.obtenerEstado())")
