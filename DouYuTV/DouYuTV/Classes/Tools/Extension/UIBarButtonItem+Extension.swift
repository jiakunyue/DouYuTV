//
//  UIBarButtonItem+Extension.swift
//  DouYuTV
//
//  Created by Justin on 2017/1/24.
//  Copyright © 2017年 jerei. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    /*
    class func creatItem(imageName : UIImage, hightName : UIImage, size : CGSize) -> UIBarButtonItem{
        let btn = UIButton()
        btn.setImage(imageName, for: .normal)
        btn.setImage(hightName, for: .highlighted)
        btn.frame = CGRect(origin: CGPoint.zero, size: size)
        return UIBarButtonItem(customView: btn)
    }
    */
    convenience init(imageName : UIImage, hightName : UIImage, size : CGSize) {
        let btn = UIButton()
        btn.setImage(imageName, for: .normal)
        btn.setImage(hightName, for: .highlighted)
        btn.frame = CGRect(origin: CGPoint.zero, size: size)
        
        self.init(customView: btn)
    }
}
