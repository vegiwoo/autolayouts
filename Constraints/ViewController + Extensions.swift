//
//  ViewController + Extensions.swift
//  Constraints
//
//  Created by Dmitry Samartcev on 06.02.2020.
//  Copyright © 2020 Dmitry Samartcev. All rights reserved.
//

import TinyConstraints

extension ViewController {
        
    func setupViews (orientation: UIDeviceOrientation) {
        
        view.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.8274509804, blue: 0.2156862745, alpha: 1)
        
        addSubviews()
        settingsContraints(orientation: orientation)
    }
    
    fileprivate func addSubviews() {
        if view.subviews.count == 0 {
            view.addSubview(containerView)
            containerView.addSubview(imageView)
            containerView.addSubview(externalStack)
        }
    }
    
    fileprivate func settingsContraints (orientation: UIDeviceOrientation) {
        
        
        //MARK: General settings
        
        // Internal stack for buttons
        internalButtonStack.addArrangedSubview(button1)
        internalButtonStack.addArrangedSubview(button2)
        
        button1.height(AppValues.roudedElementHeight)
        button2.height(AppValues.roudedElementHeight)
        textfield1.height(AppValues.roudedElementHeight)
        textfield1.height(AppValues.roudedElementHeight)

        externalStack.addArrangedSubview(headerLabel)
        externalStack.addArrangedSubview(textfield1)
        externalStack.addArrangedSubview(textfield2)
        externalStack.addArrangedSubview(internalButtonStack)
     
        // MARK: LandscapeRight
        if orientation == .landscapeRight {

            _ = vertConst.map{$0.map{$0.isActive = false}}
        
            if horConst.count == 0 {
                horConst = [Constraints]()

                horConst.append(containerView.edgesToSuperview(excluding: .none, insets: .init(top: offset, left: offset, bottom: offset, right: offset), relation: .equal, isActive: false, usingSafeArea: true))
                
                horConst.append(imageView.edgesToSuperview(excluding: .right, insets: .init(top: 0, left: 0, bottom: 0, right: 0), relation: .equal, isActive: false, usingSafeArea: false))
                horConst.append([imageView.width(to: containerView, multiplier: 0.4, offset: 0, relation: .equal, isActive: false)])
                
                horConst.append([externalStack.leftToRight(of: imageView, offset: 20, relation: .equalOrLess, isActive: false)])
                horConst.append([externalStack.centerY(to: imageView)])
                horConst.append([externalStack.rightToSuperview(offset: -20, relation: .equal, isActive: false)])
            }

             _ = horConst.map{$0.map{$0.isActive = true}}

            // MARK: Portrait
        } else {

            _ = horConst.map{$0.map{$0.isActive = false}}

            if vertConst.count == 0 {

                vertConst = [Constraints]()

                // Container View
                vertConst.append(containerView.edgesToSuperview(excluding: .none, insets: .init(top: 0, left: offset, bottom: offset, right: offset), relation: .equal, isActive: false, usingSafeArea: true))
                
                // Image View
                let multiplier : CGFloat = UIDevice.current.userInterfaceIdiom == .phone ? 0.65 : 0.7
                vertConst.append(imageView.edgesToSuperview(excluding: .bottom, insets: .init(top: 0, left: 0, bottom: 0, right: 0), relation: .equal, isActive: false, usingSafeArea: false))
                vertConst.append([imageView.height(to: containerView, multiplier: multiplier, offset: 0, relation: .equal, isActive: false)])
    
                // External Stack
                vertConst.append([externalStack.leftToSuperview(),externalStack.rightToSuperview()])
                vertConst.append([externalStack.topToBottom(of: imageView, offset: 20, relation: .equalOrLess, isActive: false)])
                vertConst.append([externalStack.bottomToSuperview(offset: -20, relation: .equalOrLess, isActive: false, usingSafeArea: false)])
//                vertConst.append([externalStack.rightToSuperview()])
//                vertConst.append([externalStack.bottomToSuperview(offset: -10, relation: .equal, isActive: false)])

            }
       
            _ = vertConst.map{$0.map{$0.isActive = true}}

        }
        
    }

}

