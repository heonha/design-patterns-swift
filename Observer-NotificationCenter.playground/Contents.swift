import UIKit

// Notification Center를 이용한 Observer 패턴 예시
// Notification Name을 정의합니다.
extension Notification.Name {
    static let myNotification = Notification.Name("MyNotification")
}

// Observer 객체를 정의합니다.
class MyObserver {
    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleNotification(_:)), name: .myNotification, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func handleNotification(_ notification: Notification) {
        print("Received notification: \(notification)")
    }
}

// Subject 객체를 정의합니다.
class MySubject {
    func postNotification() {
        NotificationCenter.default.post(name: .myNotification, object: nil)
    }
}

// 사용 예시
let observer = MyObserver()
let subject = MySubject()
subject.postNotification() // "Received notification: Notification.Name(rawValue: "MyNotification")" 출력




