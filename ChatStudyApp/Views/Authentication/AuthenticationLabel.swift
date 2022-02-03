//
//  AuthenticationLabel.swift
//  ChatStudyApp
//
//  Created by IwasakIYuta on 2022/02/03.
//

import UIKit

class AuthenticationLabel: UILabel {
    
    init(text: String, textColor: UIColor) {
        super.init(frame: .zero)
        self.text = text
         textAlignment = .center
        self.textColor = textColor
         clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
