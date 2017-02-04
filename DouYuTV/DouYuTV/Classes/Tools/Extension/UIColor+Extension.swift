//
//  UIColor+Extension.swift
//  DouYuTV
//
//  Created by Justin on 2017/2/4.
//  Copyright © 2017年 jerei. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat) {
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1.0)
    }
}
