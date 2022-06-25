//
//  UIViewController+Extension.swift
//  CatStaGram
//
//  Created by 유재호 on 2022/04/05.
//

import Foundation
import UIKit

extension UIViewController {
    //text, fonts 등 입력받아서 NSMutableAttribute~ 이런 속성을 가진 String 반환
    func generateButtonAttribute(_ button: UIButton,
                                 texts: String...,
                                 fonts: UIFont...,
                                 colors: UIColor...) -> NSMutableAttributedString {
        
        guard let wholeText = button.titleLabel?.text else { fatalError("버튼에 텍스트가 없음.")}
        
        let customFonts: [UIFont] = fonts
        let customTextsRanges = texts.indices.map { index in (wholeText as NSString).range(of: texts[index])
            
        }
        
        let customColors = colors
        
        let attributedString = NSMutableAttributedString(string: wholeText)
        
        texts.indices.forEach{ index in
            attributedString.addAttribute(.font, value: customFonts[index],range: customTextsRanges[index])
            
            attributedString.addAttribute(.foregroundColor, value: customColors[index], range: customTextsRanges[index])
            
        }
        return attributedString
    }
    
}
