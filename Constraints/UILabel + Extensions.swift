//
//  UILabel + Extensions.swift
//  Constraints
//
//  Created by Dmitry Samartcev on 06.02.2020.
//  Copyright © 2020 Dmitry Samartcev. All rights reserved.
//

import UIKit

extension UILabel {
    
    func fitTextToBounds() {
        guard let text = text, let currentFont = font else { return }
    
        let bestFittingFont = UIFont.bestFittingFont(for: text, in: bounds, fontDescriptor: currentFont.fontDescriptor, additionalAttributes: basicStringAttributes)
        font = bestFittingFont
    }
    
    private var basicStringAttributes: [NSAttributedString.Key: Any] {
        var attribs = [NSAttributedString.Key: Any]()
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = self.textAlignment
        paragraphStyle.lineBreakMode = self.lineBreakMode
        attribs[.paragraphStyle] = paragraphStyle
        
        return attribs
    }
}
