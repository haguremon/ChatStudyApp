//
//  AuthenticationTextFeild.swift
//  ChatStudyApp
//
//  Created by IwasakIYuta on 2022/02/03.
//

import UIKit

class AuthenticationTextFeild: UITextField {
   
    init(placeholder: String) {
        super.init(frame: .zero)
        backgroundColor = .white
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        layer.borderWidth = 1
        layer.borderColor = UIColor.secondaryLabel.cgColor
        leftViewMode = .always
        leftView = UIView(frame: .init(x: 0,
                                       y: 0,
                                       width: 10,
                                       height: 0))
        self.placeholder = placeholder
        layer.cornerRadius = 5
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

