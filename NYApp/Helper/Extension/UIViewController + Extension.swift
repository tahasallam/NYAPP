//
//  UIViewController + Extension.swift
//  NYApp
//
//  Created by Taha Abdelrahman on 3/19/19.
//  Copyright © 2019 apple. All rights reserved.
//

import Foundation
import UIKit
import Localize_Swift
import Alamofire

import NVActivityIndicatorView

import SwiftMessages

fileprivate var activityIndicatorView:NVActivityIndicatorView?
fileprivate var activityIndicatorViewBackGround:UIView?

fileprivate var toastBackGround:UIView?
fileprivate var toastImage:UIImageView?
fileprivate var toastMessage:UILabel?
fileprivate var toastTopConstrain:NSLayoutConstraint?

extension UIViewController{
    private func setActivityInitialIndicator(){
        activityIndicatorView =  NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 100, height: 100), type: NVActivityIndicatorType.circleStrokeSpin, color: UIColor.white, padding: 1)
        activityIndicatorView?.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        activityIndicatorView?.layer.masksToBounds = true
        activityIndicatorView?.layer.cornerRadius = 7
        activityIndicatorView?.clipsToBounds = true
        activityIndicatorView?.center = self.view.center
        activityIndicatorViewBackGround = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        activityIndicatorViewBackGround?.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        activityIndicatorViewBackGround?.isHidden = true
        activityIndicatorViewBackGround?.addSubview(activityIndicatorView!)
        self.view.addSubview(activityIndicatorViewBackGround!)
        activityIndicatorViewBackGround?.translatesAutoresizingMaskIntoConstraints = false
        activityIndicatorViewBackGround?.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        activityIndicatorViewBackGround?.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        activityIndicatorViewBackGround?.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        activityIndicatorViewBackGround?.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        activityIndicatorView?.translatesAutoresizingMaskIntoConstraints = false
        activityIndicatorView?.centerXAnchor.constraint(equalTo: activityIndicatorViewBackGround!.centerXAnchor).isActive = true
        activityIndicatorView?.centerYAnchor.constraint(equalTo: activityIndicatorViewBackGround!.centerYAnchor).isActive = true
    }
    
    func startActivityInitialIndicator(){
        setActivityInitialIndicator()
        activityIndicatorView?.startAnimating()
        activityIndicatorViewBackGround?.isHidden = false
    }
    
    func stopActivityInitialIndicator(){
        activityIndicatorViewBackGround?.isHidden = true
    }
    
    
    func showToast(errorMessage:Bool,message:String=""){
        
        let warning = MessageView.viewFromNib(layout: .cardView)
        
        warning.configureDropShadow()
        
        if errorMessage{
            var message_ = ""
            if NetworkReachabilityManager()?.isReachable ?? false{
                message_ = message.count > 0 ? message : String.error
            }else{
                message_ = String.noInternetAccess
            }
            warning.configureTheme(.error)
            warning.configureContent(title: "", body: message_, iconImage: UIImage(named: "ic_wrong")!)
        }else{
            warning.configureTheme(.success)
            warning.configureContent(title: "", body: message, iconImage: UIImage(named: "ic_right")!)
        }
        warning.button?.isHidden = true
        var warningConfig = SwiftMessages.defaultConfig
        warningConfig.presentationContext = .window(windowLevel: UIWindow.Level.statusBar)
        SwiftMessages.show(config: warningConfig, view: warning)
        
    }
}
