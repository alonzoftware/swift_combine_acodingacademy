import UIKit

let f = { (a:Int, b:Int) -> Int in
    a+b
}

f(4,5)

var array:[() -> Void] = []

class Test {
    var x = 10
    
    func noEscapa(completion: () -> Void) {
        completion()
    }
    
    func escapa(completion: @escaping () -> Void) {
        array.append(completion)
    }
    
    func testSync() {
        noEscapa(completion: { x = 20 })
        
        escapa(completion: { print("Hola") })
        escapa(completion: { [weak self] in
            self?.x = 15
            print(self?.x ?? 0)
        })
    }
}

do {
    let test1 = Test()
    test1.x
    test1.testSync()
    test1.x
    array.last?()
}

array.first?()
array.last?()

