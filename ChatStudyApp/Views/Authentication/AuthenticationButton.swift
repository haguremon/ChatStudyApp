//
//  AuthenticationButton.swift
//  ChatStudyApp
//
//  Created by IwasakIYuta on 2022/02/05.
//

import UIKit

class AuthenticationButton: UIButton {
    
    override var isHighlighted: Bool {
         //isHighlightedされた時にボタンのバックグランドを変更する処理
         didSet {
             self.backgroundColor = isHighlighted ? backgroundColor?.withAlphaComponent(0.2) : backgroundColor
         }
     }

    
    
    init(title: String?,backgroundColor: UIColor?,tintColor: UIColor) {
        super.init(frame: .zero)
        layer.shadowColor = UIColor.black.cgColor //　影の色
        layer.shadowOpacity = 0.3  //影の濃さ
        layer.shadowRadius = 5.0 // 影のぼかし量
        layer.shadowOffset = CGSize(width: 5.0, height: 5.0) // 影の方向
        setTitle(title, for: .normal)
        
        setTitleColor(tintColor, for: .normal)
       
        self.backgroundColor = backgroundColor
        layer.cornerRadius = 10
        
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
