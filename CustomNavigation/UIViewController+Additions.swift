//
//  UIViewController+Additions.swift
//  Carbuddy
//
//  Created by Mobcoder on 24/07/19.
//  Copyright © 2020 Mobcoder. All rights reserved.
//

import Foundation
import UIKit

let MAIN_SCREEN = UIScreen.main
let MAIN_SCREEN_WIDTH = MAIN_SCREEN.bounds.width

extension UIViewController {
    
    //     MARK: - Create custom navigation bar
    
    func createNavgationBarWithImage(leftBtnImage: AssestsImageName?, rightBtnImage: AssestsImageName?, title: String, bgColor: UIColor, titleColor: UIColor, fontName: String, fontSize: FontSize, fontWeight: FontWeight, isLineShow : Bool = false) {
        
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.layer.masksToBounds = false
        self.navigationController?.navigationBar.barTintColor = UIColor.clear
        self.navigationItem.title = title
        
        self.navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor.white,
             NSAttributedString.Key.font: UIFont.font(name: FontFamily.NimbusSansDOT, weight: fontWeight, size: fontSize)]
        
        /////////////
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: MAIN_SCREEN_WIDTH, height: 44))
        let str = NSMutableAttributedString(string: title)
        str.apply(font: UIFont.font(name: FontFamily.NimbusSansDOT, weight: .Bold, size: .size_30), subString: title)
        
        label.attributedText = str
        var titleColor = UIColor.white
        if #available(iOS 11.0, *){
            titleColor = UIColor.white
        }
        label.textColor = titleColor
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = true

        self.navigationItem.titleView = label
        self.navigationController?.navigationItem.title = label.text
        self.navigationItem.leftBarButtonItem?.tintColor = UIColor.clear
        
        if let leftImage = leftBtnImage {
            let image = UIImage(named: leftImage.rawValue)
            let leftBtn = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(leftButtonTapped))
            leftBtn.tintColor = UIColor.white
            self.navigationItem.leftBarButtonItem = leftBtn
        }
        
        if let rightImage = rightBtnImage {
            let image = UIImage(named: rightImage.rawValue)
            let rightBtn = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(rightButtonTapped))
            rightBtn.tintColor = UIColor.white
            self.navigationItem.rightBarButtonItem = rightBtn
        }
        
        self.navigationController?.navigationBar.isHidden = false
        navigationController?.view.backgroundColor = UIColor.black
        navigationController?.isNavigationBarHidden = false
        navigationItem.hidesBackButton = true
    }
    
    // MARK: - Left button tapped
    @objc func leftButtonTapped() {
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Right button tapped
    @objc func rightButtonTapped() {
        _ = self.navigationController?.popViewController(animated: true)
    }
}


// MARK: - Enum for assets image name
enum AssestsImageName: String {
    case backIcon               =   "back"
}

// MARK:- Enum for color hex string

enum ColorHexString: String {
    case APP_WHITE                  =   "FFFFFF"
    case APP_BLACK_COLOR            =   "111112"
}

// MARK: - Enum for font size

enum FontSize: CGFloat {
    case size_30  = 30.0
    
}

// MARK: - Enum for font weight

enum FontWeight: String {
    case Bold               = "Bold"
    
}

enum FontFamily: String {
    case RobotoMono         =   "RobotoMono"
    case NimbusSansDOT      =   "NimbusSansDOT"
    case Inter              =   "Inter"
    case OpenSans           =   "OpenSans"
    case NimbusSanL         =   "NimbusSanL"
    
    func fontName(wieight: FontWeight)-> String {
        return rawValue + "-" + wieight.rawValue
    }
}

extension UIFont {
    
    class func font(name fontName: FontFamily, weight: FontWeight = .Bold, size: FontSize ) -> UIFont{
        let newSize = size.rawValue
        let fontFamily = fontName.fontName(wieight: weight)
        if let font = UIFont(name: fontFamily, size: newSize) {
            return font
        } else {
            print("error while getting font--",fontFamily)
            return UIFont.systemFont(ofSize: newSize)
        }
    }
}

extension NSMutableAttributedString {
    
    /******************** Font Attribute ********************/
    // Apply font on substring
    func apply(font: UIFont = UIFont.font(name: FontFamily.NimbusSansDOT, weight: .Bold, size: .size_30), subString: String)  {
        
        if let range = self.string.range(of: subString) {
            self.apply(font: font, onRange: NSRange(range, in: self.string))
        }
    }
    
    // Apply font on given range
    func apply(font: UIFont, onRange: NSRange) {
        
        self.addAttributes([NSAttributedString.Key.font: font], range: onRange)
    }
}
