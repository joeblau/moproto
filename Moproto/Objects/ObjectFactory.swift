//
//  ObjectFactory.swift
//  Moproto
//
//  Created by Joe Blau on 8/31/18.
//  Copyright © 2018 Joe Blau. All rights reserved.
//

import Foundation

class ObjectFactory {
    static func build() -> [Object] {
        return [
            ViewControllerObject(),
            StoryboardReferenceObject(),
            NavigationControllerObject(),
            TableViewControllerObject(),
            CollectionViewControllerObject(),
            TabBarControllerObject(),
            SplitViewControllerObject(),
            PageViewControllerObject(),
            GlkitViewControllerObject(),
            AvkitPlayerViewControllerObject(),
            ObjectObject(),
            LabelObject(),
            ButtonObject(),
            SegmentedControlObject(),
            TextFieldObject(),
            SliderObject(),
            SwitchObject(),
            ActivityIndicatorViewObject(),
            ProgressViewObject(),
            PageControlObject(),
            StepperObject(),
            HorizontalStackViewObject(),
            VerticalStackViewObject(),
            TableViewObject(),
            TableViewCellObject(),
            ImageViewObject(),
            CollectionViewObject(),
            CollectionViewCellObject(),
            CollectionReusableViewObject(),
            TextViewObject(),
            ScrollViewObject(),
            DatePickerObject(),
            PickerViewObject(),
            VisualEffectViewwithBlurObject(),
            VisualEffectViewswithBlurandVibrancyObject(),
            MapKitViewObject(),
            MetalkitViewObject(),
            GlkitViewObject(),
            ScenekitViewObject(),
            SpritekitViewObject(),
            ArkitScenekitViewObject(),
            ArkitSpritekitViewObject(),
            WebkitViewObject(),
            TapGestureRecognizerObject(),
            PinchGestureRecognizerObject(),
            RotationGestureRecognizerObject(),
            SwipeGestureRecognizerObject(),
            PanGestureRecognizerObject(),
            ScreenEdgePanGestureRecognizerObject(),
            LongPressGestureRecognizerObject(),
            CustomGestureRecognizerObject(),
            NavigationBarObject(),
            NavigationItemObject(),
            ToolbarObject(),
            BarButtonItemObject(),
            TabBarObject(),
            TabBarItemObject(),
            SearchBarObject(),
            SearchBarandSearchDisplayControllerObject(),
            BarButtonItemFixedSpaceObject(),
            BarButtonItemFlexibleSpaceObject(),
            ViewObject(),
            ContainerViewObject()
        ]
    }
}
