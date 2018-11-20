import UIKit

struct StepperObject: Object {
    var image: UIImage = #imageLiteral(resourceName: "UIStepper")
    var title: String = "stepper_title".localize
    var description: String = "stepper_description".localize
    var category: ObjectCategory = .control
    var type: MoprotoObjectType = MoprotoObjectType(name: String(describing: UIStepper.self))
}
