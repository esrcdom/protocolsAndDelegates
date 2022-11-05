
protocol AdvanceLifeSupport {
    func realizarRCP()
}

class manejadorLlamadasEmergencia {
    /* Significa que quien quiera que se establezca como delegado, cualquier clase o estructura debe tener el protocolo AdvanceLifeSupport para poder realizar RCP */
    
    var delegate: AdvanceLifeSupport?
    
    func evaluarSituacion() {
        print("Puedes decirme qué pasó?")
    }
    
    func emergenciaMedica() {
        delegate?.realizarRCP()
    }
}

struct Paramedico:AdvanceLifeSupport {
    
    init(handler: manejadorLlamadasEmergencia) {
        handler.delegate = self
    }
    
    func realizarRCP() {
        print("El Paramedico realiza compresiones ininterrumpidas en el pecho")
    }
    
}

class Doctor: AdvanceLifeSupport {
    
    init(handler: manejadorLlamadasEmergencia) {
        handler.delegate = self
    }
    
    func realizarRCP() {
        print("El Doctor realiza compresiones ininterrumpidas en el pecho")
    }
    
    func usarEstetoscopio()  {
        print("Escuchando los sonidos del corazón")
    }
    
}

//la clase cirujano hereda de doctor todos sus parametros, incluso el protocolo
class Cirujano: Doctor {
    
    override func realizarRCP() {
        super.realizarRCP()
        print("Canta Staying Alive por Los BeeGees")
    }
    
    func usarTaladroElectrico() {
        print("whirrr...")
    }
}

let Emilio = manejadorLlamadasEmergencia()
let Marcelo = Cirujano(handler: Emilio)

Emilio.evaluarSituacion()
Emilio.emergenciaMedica()
