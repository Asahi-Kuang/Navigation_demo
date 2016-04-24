//
//  extension.swift
//  navigationTest
//
//  Created by Kxx.xxQ 一生相伴 on 16/4/24.
//  Copyright © 2016年 Asahi_Kuang. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    // 获取随机颜色
    internal func getRandomColor() ->UIColor {
        let r = arc4random_uniform(255)
        let g = arc4random_uniform(255)
        let b = arc4random_uniform(255)
        
        let dotR = CGFloat(r)
        let dotG = CGFloat(g)
        let dotB = CGFloat(b)
        
        
        let color = UIColor.init(red: dotR/255.0, green: dotG/255.0, blue: dotB/255.0, alpha: 1.0)
        return color
    }
}