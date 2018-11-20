import UIKit

struct PanGestureRecognizerObject: Object {
    var image: UIImage = #imageLiteral(resourceName: "UIPanGestureRecognizer")
    var title: String = "pan_gesture_recognizer_title".localize
    var description: String = "pan_gesture_recognizer_description".localize
    var category: ObjectCategory = .gesture
    var type: MoprotoObjectType = MoprotoObjectType(name: String(describing: UIPanGestureRecognizer.self))
}
