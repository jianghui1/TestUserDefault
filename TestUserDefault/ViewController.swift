//
//  ViewController.swift
//  TestUserDefault
//
//  Created by ys on 16/9/6.
//  Copyright © 2016年 jzh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    private var length: CGFloat = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
    
        // 两种方法删除NSUserDefaults所有记录
        // MARK: - METHOD 1
        let appDomain = NSBundle.mainBundle().bundleIdentifier
        NSUserDefaults.standardUserDefaults().removePersistentDomainForName(appDomain!)
        
        // MARK: - METHOD 2
        let defs = NSUserDefaults.standardUserDefaults()
        let dict = defs.dictionaryRepresentation()
        for key in dict.keys {
            defs.removeObjectForKey(key)
        }
        defs.synchronize()
        
    
        // 禁止锁屏
        UIApplication.sharedApplication().idleTimerDisabled = true
        
        // 手动更改iOS状态栏的颜色
        let statusBar = UIApplication.sharedApplication().valueForKey("statusBarWindow")?.valueForKey("statusBar") as? UIView
        statusBar?.backgroundColor = UIColor.redColor()
        
        length += UIScreen.mainScreen().bounds.width
        print(length)
        
        // 判断对象是否遵循了某协议
//        if statusBar?.conformsToProtocol(<#T##aProtocol: Protocol##Protocol#>) {
//            <#code#>
//        }

        // 判断view是不是指定视图的子视图
        let isView = view .isDescendantOfView(view)
        print(isView)
        
        // UIImage占用内存大小
        let image = UIImage()
        let size = CGImageGetHeight(image.CGImage) * CGImageGetBytesPerRow(image.CGImage)
        print(size)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(onOrientationChanged), name: UIApplicationDidChangeStatusBarOrientationNotification, object: nil)
        
    }
    
    func onOrientationChanged() -> () {
        
        UIApplication.sharedApplication().setStatusBarHidden(false, withAnimation: UIStatusBarAnimation.Fade)
    }


}

