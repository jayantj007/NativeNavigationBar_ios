//
//  ViewController.swift
//  CustomNavigation
//
//  Created by apple on 25/06/21.
//

import UIKit

class ViewController: BaseViewC {
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.createCustomNavigation()
    }
    
    //MARK:- Additional Functionalities
    private func createCustomNavigation() -> Void {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.createNavgationBarWithImage(leftBtnImage: AssestsImageName.backIcon, rightBtnImage: AssestsImageName(rawValue: ""), title: "", bgColor: UIColor.black, titleColor: UIColor.black, fontName: FontFamily.NimbusSansDOT.rawValue, fontSize: .size_30, fontWeight: .Bold)
    }
    
    override func leftButtonTapped() {
        print("Tap")
    }
}

