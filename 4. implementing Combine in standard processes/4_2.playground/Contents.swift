import UIKit
import Combine

enum ErroresVarios:Error, LocalizedError {
    case haCascado(Int), haPetado, haReventado
    
    var errorDescription: String? {
        switch self {
        case .haCascado(let value):
            return "Ha cascado porque sí con el valor \(value)"
        case .haPetado:
            return "Ha petado porque le tocaba"
        case .haReventado:
            return "Ha reventado porque no le cabía más"
        }
    }
}

let subject = PassthroughSubject<Int,ErroresVarios>()

subject.send(1)

let subscriber = subject.sink { completion in
    switch completion {
    case .finished: print("Todo ha terminado bien")
    case .failure(let error): print("Ha ocurrido un error \(error.localizedDescription)")
    }
} receiveValue: { value in
    print("Ha recibido el valor \(value).")
}

subject.send(2)
sleep(1)
subject.send(3)
sleep(1)

//subject.send(completion: .finished)
subject.send(completion: .failure(.haCascado(3)))

sleep(1)
subject.send(4)
