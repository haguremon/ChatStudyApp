//
//  LoginViewController.swift
//  ChatStudyApp
//
//  Created by IwasakIYuta on 2022/02/03.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupGradientLayer()
        
    }
    
    
    private func setupGradientLayer() {
        let layer = CAGradientLayer()
        
        let startColor = UIColor.rgb(red: 30, green: 96, blue: 255).cgColor
        let endColor = UIColor.rgb(red: 30, green: 208, blue: 255, alpha: 0.95).cgColor
     
        layer.colors = [startColor,endColor]
        
        layer.locations = [0.0,1.3]
        layer.frame = view.bounds
        view.layer.addSublayer(layer)
    }


}
