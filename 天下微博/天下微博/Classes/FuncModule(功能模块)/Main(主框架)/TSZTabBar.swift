//
//  TSZTabBar.swift
//  天下微博
//
//  Created by Tsz on 15/10/9.
//  Copyright © 2015年 Tsz. All rights reserved.
//

import UIKit

 /// 定义一个代理
protocol TSZTabBarDelegate: NSObjectProtocol {
    func tabBar(tabBar:TSZTabBar , toIndex: Int)
}

class TSZTabBar: UIView {
    
    //定义全局属性
     var currentBtnSelect: UIButton?
    var backImage:UIImageView?
    weak var delegate: TSZTabBarDelegate?
    /**
    通过代码添加按钮
    */
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addBackGround()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK  - 添加按钮
    func  addButtonWithBarItem(tabItem:UITabBarItem){
        //创建按钮
        let btn = UIButton()
        //添加到view
        self.addSubview(btn)
        //设置图片
        btn.setImage(tabItem.image, forState: UIControlState.Normal)
        btn.setImage(tabItem.selectedImage, forState: UIControlState.Selected)
        //添加监听事件
        btn.addTarget(self, action: "btnCilck:", forControlEvents: UIControlEvents.TouchDown)
        
        //默认设置选中第0个按钮
        let count:Int = self.subviews.count
        if 1 == count{
            btnCilck(btn)
        }
    }
    
    func btnCilck(btn: UIButton){
        //设置按钮的选中状态
        currentBtnSelect?.selected = false
        btn.selected = true
        //赋值
        currentBtnSelect = btn
        //改变背景颜色
        UIView.animateWithDuration(0.5) { () -> Void in
//            backImage.x = btn.x
            backImage?.frame.origin.x = btn.frame.origin.x
        }
        
        //启动代理
        delegate?.tabBar(self, toIndex: btn.tag)
        
    }
    
    /**
    *布局子控件
    */
    override func layoutSubviews() {
        super.layoutSubviews()
        let count = self.subviews.count - 1
        let tabBarW = self.bounds.size.width
        let tabBarH = self.bounds.size.height
        
        //设置背景色图片的frame
        backImage?.frame = CGRectMake(0, 5, tabBarW / CGFloat(count), tabBarH)
        //btn的大小
        let btnY:CGFloat = 0
        let btnW = tabBarW / CGFloat(count)
        let btnH = tabBarH
        
        for i in 1...count{
            //取出对应的button
            let btn: UIView = self.subviews[i]
            
            //计算frame
            let btnX: CGFloat = CGFloat(i - 1)*btnW
            //设置frame
            btn.frame = CGRectMake(btnX, btnY, btnW, btnH)
            btn.tag = i-1
        }
        
    }
    
    //添加背景图片
    func addBackGround(){
        
        let backGround: UIImageView = UIImageView()
        backGround.image = UIImage(named: "toolBar_shade")
        backImage = backGround
        self.addSubview(backImage!)
    }
    
//画图
    override func drawRect(rect: CGRect) {
        let image: UIImage = UIImage(named: "tabBar_back")!
        image .drawInRect(rect)
    }
}
