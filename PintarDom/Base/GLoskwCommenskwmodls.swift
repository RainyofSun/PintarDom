//
//  GLoskwCommenskwmodls.swift
//  PintarDom
//
//  Created by 一刻 on 2025/11/13.
//

import UIKit

let LOGIN_OBERVER_KEY: String = "userHasLogin"

@objcMembers class GLoskwCommenskwmodls: NSObject {
    /// 登录信息
    open var appLoginInfo: PersonalsInsdoModel? {
        didSet {
            self.userHasLogin = appLoginInfo != nil
        }
    }
    /// 国家代码 1=默认印度(审核面)   2=墨西哥(用户面)
    open var countryCode: Int = .zero
    /// 隐私协议
    open var privacyURL: String?
    /// 产品的ID
    open var productID: String?
    /// 产品金额
    open var productAmount: String?
    /// 订单号
    open var productOrderNum: String?
    /// 接口是否初始化成功
    open var isAppInitializationSuccess: Bool = false
    /// 首页产品 ID
    open var home_commodity_id: String?
    /// 是否要展示定位弹窗
    open var showPositionAlert: Bool = false
    /// 外界监听登出/登录
    @objc private dynamic var userHasLogin: Bool = false
    
    /// 城市列表的json文件目录
    open var ciprosjdkCityPath: String {
        if let document = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first {
            // 存储到临时路径下
            let filePath: String = document + "/city.json"
            return filePath
        }
        
        return ""
    }
    
    public static let shared = GLoskwCommenskwmodls()
    
    /// 登录信息保存到本地˜
    func encoderukpersinwoinfoToDskkd() {
        APPInfomationCache.loginInfomationSaveToDisk(self.appLoginInfo?.modelToJSONString())
        // 更新 token
        APPPublicParams.request().appUpdateLoginToken(self.appLoginInfo?.powerfully ?? "", withContryCode: nil)
    }
    
    /// 读取本地登录信息
    func unencodeuasdwyruenyws() {
        guard let _json_str = APPInfomationCache.loginInformationReadFormDiskCache() else {
            APPCocoaLog.error("读取本地存储的信息失败 ---------")
            return
        }
        
        self.appLoginInfo = PersonalsInsdoModel.model(withJSON: _json_str)
        // 更新 token
        APPPublicParams.request().appUpdateLoginToken(self.appLoginInfo?.powerfully ?? "", withContryCode: nil)
    }
    
    /// 登录过期删除本地信息
    func deleteexsawpersowInfoFamwjromDiskk() {
        self.productID = nil
        self.appLoginInfo = nil
        APPInfomationCache.loginInfomationSaveToDisk(nil)
    }
}
