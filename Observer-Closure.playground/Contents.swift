import UIKit

//MARK: - Closure를 이용한 구현
// Swift에서는 Closure를 이용하여 Observer 패턴을 구현할 수도 있습니다.
// 이 방법은 Notification Center보다 더 간편하게 구현할 수 있으며, 코드의 가독성을 높일 수 있습니다.


//MARK: Observer 객체 정의
class MyObserver {
    var handler: (() -> Void)? // 호출되면 return됨
    
    func handleNotification() {
        handler?()
    }
}

//MARK: Subject 객체를 정의합니다.
class MySubject {
    var observer: MyObserver?
    
    func postNotification() {
        observer?.handleNotification()
    }
}

// 사용 예시
let observer = MyObserver()
observer.handler = {
    print("수신 된 Notification")
}

let subject = MySubject()
subject.observer = observer
subject.postNotification() // "Received notification" 출력

