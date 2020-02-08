//
//  AppValues.swift
//  Constraints
//
//  Created by Dmitry Samartcev on 07.02.2020.
//  Copyright © 2020 Dmitry Samartcev. All rights reserved.
//

import Foundation
import UIKit

final class AppValues {
    
    static let idiom = UIDevice.current.userInterfaceIdiom
    
    static let shared = AppValues()
    
    static var headerFontSize : CGFloat {get {return sizeСalculation(value: 30.0)}}
    
    static var textFieldFontSize : CGFloat {get {return sizeСalculation(value: 20.0)}}
    
    static var buttonTitleFontSize : CGFloat {get {return sizeСalculation(value: 18.0)}}
    
    static var cornerRadius : CGFloat {get {return sizeСalculation(value: 20)}}
    static var roudedElementHeight : CGFloat {get{return sizeСalculation(value: 40)}}
    
    private init () {}
    
    static fileprivate func sizeСalculation (value : CGFloat) -> CGFloat {
        return UIDevice.current.userInterfaceIdiom == .phone ? value : value * 1.5
    }

}
