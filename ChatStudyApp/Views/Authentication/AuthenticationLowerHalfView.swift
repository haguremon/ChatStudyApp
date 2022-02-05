//
//  AuthenticationLowerHalfView.swift
//  ChatStudyApp
//
//  Created by IwasakIYuta on 2022/02/05.
//

import UIKit

class AuthenticationLowerHalfView: UIView {
    
    private static let googleButton = createTopButton(selectImagename: "グーグル0", unselectImagename: "グーグル1")
    private static let appleButton = createTopButton(selectImagename: "アップル0", unselectImagename: "アップル1")
    private static let twitterButton = createTopButton(selectImagename: "ツイッター0", unselectImagename: "ツイッター1")
    let buttonViews = [googleButton,appleButton,twitterButton]
   private let lowerHalfViewTitlelabel = AuthenticationLabel(text: "下記でアカウントを作成する", textColor: .white)
    
    static private func createTopButton(selectImagename: String?,unselectImagename: String?) -> UIButton {
        let button = UIButton(type: .custom)
      
        button.layer.shadowColor = UIColor.black.cgColor //　影の色
        button.layer.shadowOpacity = 0.3  //影の濃さ
        button.layer.shadowRadius = 5.0 // 影のぼかし量
        button.layer.shadowOffset = CGSize(width: 5.0, height: 5.0) // 影の方向
        button.setImage(UIImage(named: selectImagename ?? ""), for: .selected)
        button.setImage(UIImage(named: unselectImagename ?? ""), for: .normal)
        button.backgroundColor = .white
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       
        configureUI()
    }
    
     override func draw(_ rect: CGRect) {
         let bezierPath = UIBezierPath()
         let dashes:[CGFloat] = [10,5]
         bezierPath.move(to: CGPoint(x: 0, y: rect.minY))
         UIColor.black.setFill()
         bezierPath.addLine(to: CGPoint(x: rect.width, y: rect.minY))
         bezierPath.lineCapStyle = .round
         bezierPath.setLineDash(dashes, count: dashes.count, phase: 0)
         bezierPath.stroke()
         
     }
    
    private func configureUI() {
        backgroundColor = .clear
        
        addSubview(lowerHalfViewTitlelabel)
        lowerHalfViewTitlelabel.anchor(top: topAnchor,centerX: centerXAnchor, topPadding: 5)
        

        
        let  stackViewButton = UIStackView(arrangedSubviews: buttonViews)
        stackViewButton.axis = .horizontal
        stackViewButton.spacing = 30
        stackViewButton.distribution = .fillEqually
        
        addSubview(stackViewButton)
        stackViewButton.anchor(top: lowerHalfViewTitlelabel.bottomAnchor,centerX: centerXAnchor,topPadding: 30)
        
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
