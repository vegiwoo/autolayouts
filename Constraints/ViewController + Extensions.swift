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
        }
    }
    
    fileprivate func settingsContraints (orientation: UIDeviceOrientation) {
        
        
        //MARK: General settings
        var arrayToExternalStack = [UIView]()
        
        // Internal stack for buttons
        internalStackView.stack([button1,button2], axis: .horizontal, width: nil, height: nil, spacing: offset / 2)
        button1.width(to: internalStackView, multiplier: 0.45, offset: 0, relation: .equal, isActive: true)
        button2.width(to: internalStackView, multiplier: 0.45, offset: 0, relation: .equal, isActive: true)
        
        // External stack
        arrayToExternalStack = [headerLabel, textfield1, textfield2, internalStackView]
        
        
        stackView.stack(arrayToExternalStack, axis: .vertical, width: nil, height: -50, spacing: offset)
        
        // MARK: LandscapeRight
        if orientation == .landscapeRight {
            
            // DeActive vertical constraints
            _ = verticalConstraints.forEach {const in _ = const.map{$0.isActive = false}}
            
            if horConst.count == 0 {
                horConst = [Constraints]()
                
                //Create horizontal constraints
                horConst.append(containerView.edgesToSuperview(excluding: .none, insets: .init(top: offset, left: offset, bottom: offset, right: offset), relation: .equal, isActive: false, usingSafeArea: true))
                
                horConst.append(containerView.stack([imageView, stackView], axis: .horizontal, width: nil, height: nil, spacing: offset))
                horConst.append([imageView.width(to: containerView, multiplier: 0.4, offset: 0, relation: .equalOrLess,  isActive: false)])
                horConst.append([stackView.width(to: containerView, multiplier: 0.6, offset: 0, relation: .equal,  isActive: false)])
                horConst.append([])
            }
            
            //Activate horizontal constraints
            _ = horConst.forEach {const in _ = const.map{$0.isActive = true}}
            
            // MARK: Portrait
        } else {
            // DeActive horizontal constraints
            _ = horConst.forEach {const in _ = const.map{$0.isActive = false}}
            
            if verticalConstraints.count == 0 {
                
                //Create vertical constraints
                verticalConstraints = [Constraints]()
                
                verticalConstraints.append(containerView.edgesToSuperview(excluding: .none, insets: .init(top: 0, left: offset, bottom: offset, right: offset), relation: .equal, isActive: false, usingSafeArea: true))
                
                
                let multiplier = UIDevice.current.userInterfaceIdiom == .phone ? (0.6, 0.4) :  (0.7, 0.3)
                            
                verticalConstraints.append(containerView.stack([imageView, stackView], axis: .vertical, width: nil, height: nil, spacing: offset))
                verticalConstraints.append([imageView.height(to: containerView, multiplier: CGFloat(multiplier.0), offset: -10, relation: .equal,  isActive: false)])
                verticalConstraints.append([stackView.height(to: containerView, multiplier: CGFloat(multiplier.1), offset: 0, relation: .equalOrGreater,  isActive: false)])
                
            }
            //Activate vertical constraints
            _ = verticalConstraints.forEach {const in _ = const.map{$0.isActive = true}}
            
        }
        
    }

}

