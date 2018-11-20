import UIKit

struct SwipeGestureRecognizerObject: Object {
    var image: UIImage = #imageLiteral(resourceName: "UISwipeGestureRecognizer")
    var title: String = "swipe_gesture_recognizer_title".localize
    var description: String = "swipe_gesture_recognizer_description".localize
    var category: ObjectCategory = .gesture
    var type: MoprotoObjectType = MoprotoObjectType(name: String(describing: UISwipeGestureRecognizer.self))
}
