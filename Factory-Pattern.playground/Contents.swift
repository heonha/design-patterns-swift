import Foundation

// ### Factory Method 패턴
//
// - 객체를 생성하는 과정을 캡슐화하여, **객체의 생성과정과 사용을 분리**시키는 패턴입니다.
// - 이 패턴을 사용하면 **객체의 생성 과정을 수정하지 않고도 객체의 생성 방식을 변경**할 수 있다.
//     → 이를통해 유지보수와 확장성을 높일 수 있습니다.


//MARK: - Product 타입 정의 (Protocol)
protocol Product {
    func getName() -> String
}

//MARK: Product 구현체 정의 (Product A, B)
class ProductA: Product {
    func getName() -> String {
        return "Product A"
    }
}

class ProductB: Product {
    func getName() -> String {
        return "Product B"
    }
}

//MARK: - Creator 타입 정의 (Protocol)
protocol Creator {
    func createProduct() -> Product
}

//MARK: Creator 구현체 정의 (Creater A, B)
class CreatorA: Creator {
    func createProduct() -> Product {
        return ProductA()
    }
}

class CreatorB: Creator {
    func createProduct() -> Product {
        return ProductB()
    }
}


//MARK: - 사용 예시
let creatorA: Creator = CreatorA()
let creatorB: Creator = CreatorB()

let productA: Product = creatorA.createProduct()
print(productA.getName()) // "Product A" 출력

let productB: Product = creatorB.createProduct()
print(productB.getName()) // "Product B" 출력
