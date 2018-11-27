import UIKit

struct RotationGestureRecognizerObject: HUDItem {
    var image: UIImage = #imageLiteral(resourceName: "UIRotationGestureRecognizer")
    var title: String = "rotation_gesture_recognizer_title".localize
    var description: String = "rotation_gesture_recognizer_description".localize
    var category: ObjectCategory = .gesture
    var type: MoprotoObjectType = MoprotoObjectType(name: String(describing: UIRotationGestureRecognizer.self))
}
