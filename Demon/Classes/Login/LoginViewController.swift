//
//  LoginViewController.swift
//  Demon
//
//  Created by afarsoft on 2017/8/8.
//  Copyright © 2017年 afarsoft. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func qqLogin(_ sender: UIButton) {
        ShareSDK.getUserInfo(SSDKPlatformType.typeQQ) { (state, user, error) in
            if state == SSDKResponseState.success{
                print("成功");
            }else{
               print("失败");
            }
        }
    }
    
    @IBAction func weixinLogin(_ sender: UIButton) {
    }

}
