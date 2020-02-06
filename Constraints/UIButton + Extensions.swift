//
//  UIButton + Extensions.swift
//  Constraints
//
//  Created by Dmitry Samartcev on 06.02.2020.
//  Copyright © 2020 Dmitry Samartcev. All rights reserved.
//

import UIKit

extension UIButton {
    
    func fitTextToBounds() {
        guard let text = self.titleLabel?.text, let currentFont = self.titleLabel?.font else { return }
    
        let bestFittingFont = UIFont.bestFittingFont(for: text, in: bounds, fontDescriptor: currentFont.fontDescriptor, additionalAttributes: basicStringAttributes)
        self.titleLabel?.font = bestFittingFont
    }
    
    private var basicStringAttributes: [NSAttributedString.Key: Any] {
        var attribs = [NSAttributedString.Key: Any]()
        
        let paragraphStyle = NSMutableParagraphStyle()
        
        
        if let label = self.titleLabel {
            paragraphStyle.alignment = label.textAlignment
            attribs[.paragraphStyle] = paragraphStyle
        }

        attribs[.paragraphStyle] = paragraphStyle
        
        return attribs
    }
}
