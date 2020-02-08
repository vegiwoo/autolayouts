//
//  ViewController.swift
//  Constraints
//
//  Created by Dmitry Samartcev on 06.02.2020.
//  Copyright © 2020 Dmitry Samartcev. All rights reserved.
//

import UIKit
import TinyConstraints

class ViewController: UIViewController {
    
    var currentDeviceOrientation: UIDeviceOrientation? {
        willSet (value) {
            if let newVal = value {
                setupViews(orientation: newVal)
            }
        }
    }
    
    var horConst = [Constraints]()
    var verticalConstraints   = [Constraints]()
    
    let offset : CGFloat = 20.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        currentDeviceOrientation = UIDevice.current.orientation
        setupViews(orientation: currentDeviceOrientation!)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        if UIDevice.current.orientation.isLandscape {
            currentDeviceOrientation = .landscapeRight

        } else if (UIDevice.current.orientation.isPortrait) {
            currentDeviceOrientation = .portrait
        }
    }
    
    var containerView : UIView = {
        let uv = UIView()
        uv.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.4588235294, blue: 0.1803921569, alpha: 1)
        uv.translatesAutoresizingMaskIntoConstraints = false
        uv.clipsToBounds = true
        return uv
    }()
    
    var stackView : UIView = {
        let uv = UIView()
        uv.backgroundColor = #colorLiteral(red: 0.1411764706, green: 0.7764705882, blue: 0.8470588235, alpha: 1)
        uv.translatesAutoresizingMaskIntoConstraints = false
        uv.clipsToBounds = true
        return uv
    }()
    
    var internalStackView : UIView = {
        let uv = UIView()
        uv.backgroundColor = .green
        uv.translatesAutoresizingMaskIntoConstraints = false
        uv.clipsToBounds = true
        return uv
    }()
    
    var imageView : UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.1882352941, blue: 0.1882352941, alpha: 1)
        iv.image = UIImage(named: "image-dummy")
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.clipsToBounds = true
        return iv
    }()
    
    
    var headerLabel : UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: "PingFangHK-Semibold", size: AppValues.headerFontSize)
        lbl.backgroundColor = #colorLiteral(red: 0.1411764706, green: 0.5568627451, blue: 0.6470588235, alpha: 1)
        lbl.textColor = #colorLiteral(red: 0.9490196078, green: 0.8274509804, blue: 0.2156862745, alpha: 1)
        lbl.text = "Header"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.clipsToBounds = true
        lbl.fitTextToBounds()
        return lbl
    }()
    
    var textfield1 : UITextField = {
        let field = UITextField()
        field.font = UIFont(name: "PingFangHK-Regular", size: AppValues.textFieldFontSize)
        field.textColor = UIColor(named: "yellow")
        field.backgroundColor = #colorLiteral(red: 0.1411764706, green: 0.5568627451, blue: 0.6470588235, alpha: 1)
        field.layer.borderColor = #colorLiteral(red: 0.9490196078, green: 0.8274509804, blue: 0.2156862745, alpha: 1)
        field.layer.borderWidth = 1.0
        field.placeholder = "Something ..."
        field.translatesAutoresizingMaskIntoConstraints = false
        field.clipsToBounds = true
        field.fitTextToBounds()
        return field
    }()
    
    var textfield2 : UITextField = {
        let field = UITextField()
        field.font = UIFont(name: "PingFangHK-Regular", size: AppValues.textFieldFontSize)
        field.backgroundColor = #colorLiteral(red: 0.1411764706, green: 0.5568627451, blue: 0.6470588235, alpha: 1)
        field.textColor = #colorLiteral(red: 0.9490196078, green: 0.8274509804, blue: 0.2156862745, alpha: 1)
        field.layer.borderColor = #colorLiteral(red: 0.9490196078, green: 0.8274509804, blue: 0.2156862745, alpha: 1)
        field.layer.borderWidth = 1.0
        field.placeholder = "Something ..."
        field.translatesAutoresizingMaskIntoConstraints = false
        field.clipsToBounds = true
        field.fitTextToBounds()
        return field
    }()
    
    var button1 : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.4588235294, blue: 0.1803921569, alpha: 1)
        btn.layer.cornerRadius = 15
        btn.setTitle("Button1", for: .normal)
        btn.titleLabel?.font = UIFont(name: "PingFangHK-Medium", size: AppValues.buttonTitleFontSize)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.clipsToBounds = true
        btn.fitTextToBounds()
        return btn
    }()
    
    var button2 : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.4588235294, blue: 0.1803921569, alpha: 1)
        btn.layer.cornerRadius = 15
        btn.setTitle("Button2", for: .normal)
        btn.titleLabel?.font = UIFont(name: "PingFangHK-Medium", size: AppValues.buttonTitleFontSize)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.clipsToBounds = true
        btn.fitTextToBounds()
        return btn
    }()
}
