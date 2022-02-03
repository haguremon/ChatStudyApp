//
//  UIView+Extension.swift
//  ChatStudyApp
//
//  Created by IwasakIYuta on 2022/02/03.
//

import UIKit

extension UIView {
    
 
      func anchor(
          top: NSLayoutYAxisAnchor? = nil,
          bottom: NSLayoutYAxisAnchor? = nil,
          left: NSLayoutXAxisAnchor? = nil,
          right: NSLayoutXAxisAnchor? = nil,
          centerY: NSLayoutYAxisAnchor? = nil,
          centerX: NSLayoutXAxisAnchor? = nil,
          width: CGFloat? = nil,
          height: CGFloat? = nil,
          topPadding: CGFloat = 0,
          bottomPadding: CGFloat = 0,
          leftPadding: CGFloat = 0,
          rightPadding: CGFloat = 0) {
          
          self.translatesAutoresizingMaskIntoConstraints = false
          
          if let top = top {
              self.topAnchor.constraint(equalTo: top, constant: topPadding).isActive = true
          }
          
          if let bottom = bottom {
              self.bottomAnchor.constraint(equalTo: bottom, constant: -bottomPadding).isActive = true
          }
          
          if let left = left {
              self.leftAnchor.constraint(equalTo: left, constant: leftPadding).isActive = true
          }
          
          if let right = right {
              self.rightAnchor.constraint(equalTo: right, constant: -rightPadding).isActive = true
          }
          
          if let centerY = centerY {
              self.centerYAnchor.constraint(equalTo: centerY).isActive = true
          }
          
          if let centerX = centerX {
              self.centerXAnchor.constraint(equalTo: centerX).isActive = true
          }
          
          if let width = width {
              self.widthAnchor.constraint(equalToConstant: width).isActive = true
          }
          
          if let height = height {
              self.heightAnchor.constraint(equalToConstant: height).isActive = true
          }
          
      }
    
    
    func center(inView view: UIView, yConstant: CGFloat? = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: yConstant!).isActive = true
    }
    
    
    func centerX(inView view: UIView, topAnchor: NSLayoutYAxisAnchor? = nil, paddingTop: CGFloat? = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        if let topAnchor = topAnchor {
            self.topAnchor.constraint(equalTo: topAnchor, constant: paddingTop!).isActive = true
        }
        
    }
    
    
    func centerY(inView view: UIView, leftAnchor: NSLayoutXAxisAnchor? = nil,
                 leftPadding: CGFloat = 0, constant: CGFloat = 0) {
        
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant).isActive = true
        
        if let left = leftAnchor {
            anchor(left: left, leftPadding: leftPadding)
        }
        
    }
    

    func setDimensions(height: CGFloat, width: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
    
    func setHeight(_ height: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    
    func setWidth(_ width: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    

}
