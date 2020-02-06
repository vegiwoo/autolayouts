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
        
        var arrayToStack = [UIView]()
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            arrayToStack = [UIView(),headerLabel, textfield1, textfield2, button1, button2]
        } else {
            arrayToStack = [headerLabel, textfield1, textfield2, button1, button2]
        }
        
        stackView.stack(arrayToStack, axis: .vertical, width: nil, height: -50, spacing: offset)
        
        // LandscapeRight
        if orientation == .landscapeRight {
            
            // DeActive vertical constraints
            _ = verticalConstraints.forEach {const in _ = const.map{$0.isActive = false}}
            
            if horizontalConstraints.count == 0 {
                horizontalConstraints = [Constraints]()
                
                //Create horizontal constraints
                horizontalConstraints.append(containerView.edgesToSuperview(excluding: .none, insets: .init(top: offset, left: offset, bottom: offset, right: offset), relation: .equal, isActive: false, usingSafeArea: true))
                
                horizontalConstraints.append(containerView.stack([imageView, stackView], axis: .horizontal, width: nil, height: nil, spacing: offset))
                horizontalConstraints.append([imageView.width(to: containerView, multiplier: 0.4, offset: 0, relation: .equalOrLess,  isActive: false)])
                horizontalConstraints.append([stackView.width(to: containerView, multiplier: 0.6, offset: 0, relation: .equal,  isActive: false)])
                
            }
            
            //Activate horizontal constraints
            _ = horizontalConstraints.forEach {const in _ = const.map{$0.isActive = true}}
           
        // Portrait
        } else {
            
            // DeActive horizontal constraints
            _ = horizontalConstraints.forEach {const in _ = const.map{$0.isActive = false}}
            
            if verticalConstraints.count == 0 {
                
                //Create vertical constraints
                verticalConstraints = [Constraints]()
                
                verticalConstraints.append(containerView.edgesToSuperview(excluding: .none, insets: .init(top: 0, left: offset, bottom: offset, right: offset), relation: .equal, isActive: false, usingSafeArea: true))
                
             
                
                verticalConstraints.append(containerView.stack([imageView, stackView], axis: .vertical, width: nil, height: nil, spacing: offset))
                verticalConstraints.append([imageView.height(to: containerView, multiplier: 0.6, offset: -10, relation: .equal,  isActive: false)])
                verticalConstraints.append([stackView.height(to: containerView, multiplier: 0.4, offset: 0, relation: .equalOrGreater,  isActive: false)])
        
            }
             //Activate vertical constraints
            _ = verticalConstraints.forEach {const in _ = const.map{$0.isActive = true}}
           
        }
        
    }

}

