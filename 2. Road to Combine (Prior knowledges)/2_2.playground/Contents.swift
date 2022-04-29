import UIKit

enum ErroresSuma:Error {
    case arrayVacio, datoInvalido
}

func sumaNumeros(nums:[Int]) -> Result<Int, ErroresSuma> {
    if nums.isEmpty {
        return .failure(.arrayVacio)
    }
    var suma = 0
    for num in nums {
        suma += num
    }
    return .success(suma)
}

let array = [1,4,5,6,7,5,6,4,6,7]
let suma = sumaNumeros(nums: array)
let suma2 = sumaNumeros(nums: [])

switch suma2 {
case .success(let sum):
    print("El resultado es \(sum)")
case .failure(let error):
    print("El error ha sido \(error)")
}

if case .success(let sum) = suma {
    print("El resultado es \(sum)")
}

