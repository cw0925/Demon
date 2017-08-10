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
        ShareSDK.getUserInfo(SSDKPlatformType.typeQQ) { (state : SSDKResponseState, user : SSDKUser?, error : Error?) in
            switch state{
                
            case SSDKResponseState.success:
                print("授权成功,用户信息为\(String(describing: user))\n ----- 授权凭证为\(user?.credential)")
                UIApplication.shared.keyWindow?.rootViewController = BaseTabBarController()
            case SSDKResponseState.fail:
                print("授权失败,错误描述:\(error)")
            case SSDKResponseState.cancel:
                print("操作取消")
                
            default:
                break
            }
            
        }

    }
    
    @IBAction func weixinLogin(_ sender: UIButton) {
        ShareSDK.getUserInfo(SSDKPlatformType.typeWechat) { (state : SSDKResponseState, user : SSDKUser?, error : Error?) in
            switch state{
                
            case SSDKResponseState.success:
                print("授权成功,用户信息为\(String(describing: user))\n ----- 授权凭证为\(user?.credential)")
                UIApplication.shared.keyWindow?.rootViewController = BaseTabBarController()
            case SSDKResponseState.fail:
                print("授权失败,错误描述:\(error)")
            case SSDKResponseState.cancel:
                print("操作取消")
                
            default:
                break
            }
            
        }
    }
    
    @IBAction func weiboLogin(_ sender: UIButton) {
        ShareSDK.getUserInfo(SSDKPlatformType.typeSinaWeibo) { (state : SSDKResponseState, user : SSDKUser?, error : Error?) in
            switch state{
                
            case SSDKResponseState.success:
                print("授权成功,用户信息为\(String(describing: user))\n ----- 授权凭证为\(user?.credential)")
                UIApplication.shared.keyWindow?.rootViewController = BaseTabBarController()
            case SSDKResponseState.fail:
                print("授权失败,错误描述:\(error)")
            case SSDKResponseState.cancel:
                print("操作取消")
                
            default:
                break
            }
            
        }
    }


}
