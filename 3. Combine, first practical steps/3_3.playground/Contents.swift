import Combine

let publisher = [1,4,6,5,7,8,6,5].publisher
    .filter { $0 < 7 }
    .map { "\($0)" }
    .collect(2)

let subscriber = publisher.sink(receiveValue: { value in
    print("Recibido \(value)")
})

let publisher2 = [1,5,6,7,6,5,5,1,2,6,7,8].publisher
    .filter { $0 <= 5 }
    .map { "\($0)€" }
    .reduce("", { "\($0),\($1)" })

let subscriber2 = publisher2.sink(receiveCompletion: {
                                    if case .finished = $0 {
                                        print("Ha terminado")
                                    }
}, receiveValue: { value in 
    print("Recibido \(value.dropFirst())")
})

