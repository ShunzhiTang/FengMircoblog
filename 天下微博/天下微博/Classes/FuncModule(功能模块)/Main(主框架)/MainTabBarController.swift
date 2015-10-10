//
//  MainTabBarController.swift
//  天下微博

import UIKit

class MainTabBarController: UITabBarController , TSZTabBarDelegate {
    
    //设置全局属性
    var custom: TSZTabBar?
    override func viewDidLoad() {
        super.viewDidLoad()
        addTabBar()
        setupController()
        
        custom?.delegate = self

    }
    //设置tabBar的子控制器
    private func setupController(){
       let homeVc = addChildViewController(HomeTableViewController(), image: "tabbar_home", imageSelected: "tabbar_home_highlighted", title: "首页")
        
        let MessageVc = addChildViewController(MessageTableViewController(), image: "tabbar_message_center", imageSelected: "tabbar_message_center_highlighted", title: "消息")
        //添加一个
        let defualtVc = addChildViewController(DiscoverTableViewController(), image: "add", imageSelected: "add", title: "")
        
         let DiscoverVc = addChildViewController(DiscoverTableViewController(), image: "tabbar_discover", imageSelected: "tabbar_discover_highlighted", title: "发现")
        
         let ProfileVc = addChildViewController(ProfileTableViewController(), image: "tabbar_profile", imageSelected: "tabbar_profile_highlighted", title: "我")
        
        
        self.viewControllers = [homeVc,MessageVc,defualtVc,DiscoverVc,ProfileVc]
        
    }
    
    /**
    - parameter vc           : 控制器
    - parameter image        : 默认显示图片
    - parameter imageSelected: 被选择 时的图片
    - parameter title        : 标题
    */
    private func addChildViewController(vc: UIViewController , image: String , imageSelected: String , title: String) ->UIViewController{
        vc.title = title
        tabBarItem.title = title
        //设置图片
        vc.tabBarItem.image = UIImage(named: image)
        vc.tabBarItem.selectedImage = UIImage(named: imageSelected)
        custom?.addButtonWithBarItem(vc.tabBarItem)
        
        let navigation = UINavigationController(rootViewController: vc)
        return navigation
    }
    
    //代理协议
    func tabBar(tabBar: TSZTabBar, toIndex: Int) {
        selectedIndex = toIndex
    }
    
    //添加tabBar试图
    private func addTabBar(){
        let customTabBar: TSZTabBar = TSZTabBar()
        custom = customTabBar
        customTabBar.frame = tabBar.frame
        view.addSubview(customTabBar)
        
        tabBar.removeFromSuperview()
    }
    
}
