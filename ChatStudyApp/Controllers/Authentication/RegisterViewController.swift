//
//  RegisterViewController.swift
//  ChatStudyApp
//
//  Created by IwasakIYuta on 2022/02/03.
//

import UIKit

class RegisterViewController: UIViewController {

    //MARK: - VIews
    private let titleLabel = AuthenticationLabel(text: "新規登録", textColor: .white)
    
    private let subtitleLabel = AuthenticationLabel(text: "アカウントを作成", textColor: .white)
    private let nameTextFeild = AuthenticationTextFeild(placeholder: "名前")
    private let mailTextFeild = AuthenticationTextFeild(placeholder: "メールアドレス")
    private let passwordTextFeild = AuthenticationTextFeild(placeholder: "パスワード")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureGradientLayer()
       
        configureUI()
        
    }
    
    
    //MARK: - methods
    private func configureUI() {
        view.addSubview(titleLabel)
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor,centerX: view.centerXAnchor,topPadding: 25)
        titleLabel.setDimensions(height: view.bounds.height / 11, width: view.bounds.width / 1.25)
        titleLabel.font = .boldSystemFont(ofSize: view.bounds.height / 15)
        titleLabel.backgroundColor = .systemBlue
        titleLabel.layer.cornerRadius = view.bounds.height / 35
        view.addSubview(subtitleLabel)
        subtitleLabel.anchor(top: titleLabel.bottomAnchor,centerX: view.centerXAnchor,topPadding: 10)
        subtitleLabel.setDimensions(height: view.bounds.height / 22, width: view.bounds.width / 1.20)
        subtitleLabel.font = .systemFont(ofSize: view.bounds.height / 35)
        subtitleLabel.layer.cornerRadius = view.bounds.height / 60
        
        
        let stackView = UIStackView(arrangedSubviews: [nameTextFeild,mailTextFeild,passwordTextFeild])
        stackView.axis = .vertical
        stackView.spacing = 8.5
        stackView.distribution = .fillEqually
        view.addSubview(stackView)
        nameTextFeild.setHeight(view.bounds.height / 15)
        nameTextFeild.setWidth(view.bounds.width / 1.3)
        stackView.anchor(top: subtitleLabel.bottomAnchor, centerX: view.centerXAnchor,topPadding: 20)
        
        
    }
    
    private func configureGradientLayer() {
        let layer = CAGradientLayer()
        
        let startColor = UIColor.rgb(red: 30, green: 96, blue: 255).cgColor
        let endColor = UIColor.rgb(red: 30, green: 208, blue: 255, alpha: 0.95).cgColor
     
        layer.colors = [startColor,endColor]
        
        layer.locations = [0.0,1.3]
        layer.frame = view.bounds
        view.layer.addSublayer(layer)
    }


}

