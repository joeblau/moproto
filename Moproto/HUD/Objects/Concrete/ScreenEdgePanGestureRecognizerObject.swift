import UIKit

struct ScreenEdgePanGestureRecognizerObject: HUDItem {
    var image: UIImage = #imageLiteral(resourceName: "UIScreenEdgePanGestureRecognizer")
    var title: String = "screen_edge_pan_gesture_recognizer_title".localize
    var description: String = "screen_edge_pan_gesture_recognizer_description".localize
    var category: ObjectCategory = .gesture
    var type: MoprotoObjectType = MoprotoObjectType(name: String(describing: UIScreenEdgePanGestureRecognizer.self))
}
