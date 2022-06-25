//
//  UIView+Extenstion.swift
//  CatStaGram
//
//  Created by 유재호 on 2022/04/05.
//

import UIKit

extension UIView{
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}
