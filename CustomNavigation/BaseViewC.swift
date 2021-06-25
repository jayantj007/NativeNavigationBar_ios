//
//  BaseViewC.swift
//  CustomNavigation
//
//  Created by apple on 25/06/21.
//

import UIKit

class BaseViewC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let vw = UIView(frame: CGRect(x: 0, y: 0, width: (self.navigationController?.navigationBar.bounds.width)!, height: 17))
        vw.backgroundColor = UIColor.black
        vw.layer.cornerRadius = 10
        vw.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        view.addSubview(vw)
    }
}
