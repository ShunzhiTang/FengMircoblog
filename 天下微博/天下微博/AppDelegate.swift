//
//  AppDelegate.swift
//  天下微博
//
//  Created by Tsz on 15/10/8.
//  Copyright © 2015年 Tsz. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        //创建window
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        //设置窗口颜色
        window?.backgroundColor = UIColor.grayColor()
        
        //设置根控制器
        window?.rootViewController = MainTabBarController()
        
        
        //显示窗口
        window?.makeKeyAndVisible()
        
        return true
    }
}

