//
//  StoryboardReferenceObject.swift
//  Moproto
//
//  Created by Joe Blau on 9/2/18.
//  Copyright © 2018 Joe Blau. All rights reserved.
//

import UIKit

struct StoryboardReferenceObject: HUDItem {
    var image: UIImage = #imageLiteral(resourceName: "UIExternalViewController")
    var title: String = "storyboard_reference_title".localize
    var description: String = "storyboard_reference_description".localize
    var category: ObjectCategory = .controller
    var type: MoprotoObjectType = MoprotoObjectType(name: "UIStoryboardReference")
}
