//
//  RegisterViewController.swift
//  ChatStudyApp
//
//  Created by IwasakIYuta on 2022/02/03.
//

import UIKit
import RxSwift
import RxCocoa

class RegisterViewController: UIViewController {

    let  disposeBag =  DisposeBag()
    let viewModel = AuthenticationViewModel()
    
    //MARK: - VIews
    private let titleLabel = AuthenticationLabel(text: "新規登録", textColor: .white)
    private let subtitleLabel = AuthenticationLabel(text: "アカウントを作成", textColor: .white)
    private let nameTextFeild = AuthenticationTextFeild(placeholder: "名前")
    private let mailTextFeild = AuthenticationTextFeild(placeholder: "メールアドレス")
    private let passwordTextFeild = AuthenticationTextFeild(placeholder: "パスワード")
    
    private let registerButton = AuthenticationButton(title: "新規登録", backgroundColor: .systemRed, tintColor: .white)
    private  let alreadyhaveAnAccountButton = AuthenticationButton(title: "既にアカウントをお持ちの方はこちら", backgroundColor: nil, tintColor: .green)
   private let lowerHalfView = AuthenticationLowerHalfView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureGradientLayer()
        configureUI()
        configureBindins()
    }
    
    
    //MARK: - methods
    private func configureUI() {
        
        let stackViewTextFeild = UIStackView(arrangedSubviews: [nameTextFeild,mailTextFeild,passwordTextFeild])
        stackViewTextFeild.axis = .vertical
        stackViewTextFeild.spacing = 8.5
        stackViewTextFeild.distribution = .fillEqually
        view.addSubview(stackViewTextFeild)
       // nameTextFeild.setHeight(view.bounds.height / 15)
        nameTextFeild.setHeight(50)
        nameTextFeild.setWidth(view.bounds.width / 1.3)
        stackViewTextFeild.anchor(centerX: view.centerXAnchor)
        passwordTextFeild.center(inView: view)
        
        view.addSubview(subtitleLabel)
        subtitleLabel.anchor(bottom: stackViewTextFeild.topAnchor,centerX: view.centerXAnchor,bottomPadding: 15)
        subtitleLabel.setDimensions(height: view.bounds.height / 22, width: view.bounds.width / 1.20)
        subtitleLabel.font = .systemFont(ofSize: view.bounds.height / 35)
        subtitleLabel.layer.cornerRadius = view.bounds.height / 60
        
        view.addSubview(titleLabel)
        titleLabel.anchor(bottom: subtitleLabel.topAnchor,centerX: view.centerXAnchor,bottomPadding: 30)
        titleLabel.setDimensions(height: view.bounds.height / 11, width: view.bounds.width / 1.25)
        titleLabel.font = .boldSystemFont(ofSize: view.bounds.height / 15)
        titleLabel.backgroundColor = .systemBlue
        titleLabel.layer.cornerRadius = view.bounds.height / 35
        

        
        
    
        
        let stackViewButton = UIStackView(arrangedSubviews: [registerButton,alreadyhaveAnAccountButton])
        stackViewButton.axis = .vertical
        stackViewButton.spacing = 10
        stackViewButton.alignment = .center
        stackViewButton.distribution = .fill
        
        view.addSubview(stackViewButton)
        
        stackViewButton.anchor(top: stackViewTextFeild.bottomAnchor,centerX: view.centerXAnchor, topPadding: 20)
        registerButton.anchor(width: view.bounds.width / 2,height: view.bounds.height / 22)
        alreadyhaveAnAccountButton.anchor(width: view.bounds.width / 1.5)
        alreadyhaveAnAccountButton.titleLabel?.adjustsFontSizeToFitWidth = true
        
        view.addSubview(lowerHalfView)
        
        lowerHalfView.anchor(top: stackViewButton.bottomAnchor, bottom: view.bottomAnchor, left: view.leftAnchor, centerX: view.centerXAnchor, topPadding: 10, bottomPadding: 0, leftPadding: 0, rightPadding: 0)
        lowerHalfView.buttonViews.forEach { $0.setDimensions(height: view.bounds.width / 6, width: view.bounds.width / 6)
            $0.layer.cornerRadius = view.bounds.width / 12
        }
      
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
    
   private func configureBindins() {
       
       
       nameTextFeild.rx.text
               .asDriver()
               .drive { [ weak self ] text in
                   
                   self?.viewModel.nameTextOutput.onNext(text ?? "")
                 
               }.disposed(by: disposeBag)

       mailTextFeild.rx.text
               .asDriver()
               .drive { [ weak self ] text in
                   
                   self?.viewModel.emailTextOutput.onNext(text ?? "")
                   
               }.disposed(by: disposeBag)
       
       passwordTextFeild.rx.text
               .asDriver()
               .drive { [ weak self ] text in
                   
                   self?.viewModel.passwordTextOutput.onNext(text ?? "")
                   
               }.disposed(by: disposeBag)
       
       registerButton.rx.tap
           .asDriver()
           .drive { [weak self] _ in
               self?.registerButton.pressAnimation()
               
           }.disposed(by: disposeBag)
       
       viewModel.validRegisterDriver
           .drive { validAll in
               //validAllによってボタンの処理が変わる
               self.registerButton.isEnabled = validAll
               self.registerButton.backgroundColor = validAll ? .rgb(red: 227, green: 48, blue: 78) : .init(white: 0.7, alpha: 1)
           }.disposed(by: disposeBag)
       
       alreadyhaveAnAccountButton.rx.tap
           .asDriver()
           .drive { [weak self] _ in
               self?.alreadyhaveAnAccountButton.pressAnimation()
               self?.openLoginViewController()
               
           }.disposed(by: disposeBag)
       
       lowerHalfView.buttonViews.forEach { (button) in
           button.rx.tap
                 .asDriver()
                 .drive { _ in
                  button.pressAnimation()
                   
                }.disposed(by: disposeBag)
       }

        
    }
    
    private func openLoginViewController() {
        
        let loginViewController = LoginViewController()
        
        present(loginViewController, animated: true)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
         view.endEditing(true)
     }


}

