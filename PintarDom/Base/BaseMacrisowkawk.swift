//
//  BaseMacrisowkawk.swift
//  PintarDom
//
//  Created by 一刻 on 2025/11/13.
//

/*
 -----------------------------
 文档地址：https://doc.alta-dg.mx/id_pintar_dompet_ios/index.html
 文档反转义地址：https://doc.alta-dg.mx/decode.php?project=id_pintar_dompet_ios
 接口访问地址：http://149.129.233.8:5010/asutf

 接口文档账号：dev
 接口文档密码：fly2024

 Tips:  接口调试流程注意文档  https://note.youdao.com/s/cJPkcHQz
 -----------------------------
 ### 原生 h5 交互函数

 ```
 impossible()关闭当前webview
 attain(String url, String params)带参数页面跳转
 transports()回到首页，并关闭当前页
 impassioned() app store评分功能
 horror() 确认申请埋点调用方法
 ```

 -----------------------------
 */

/// 关闭当前Web
let CloseWebPage: String = "impossible"
/// 页面带参数跳转
let PageTransitionNoParams: String = "attain"
/// 关闭当前页面回到首页
let CloseAndGotoHome: String = "transports"
/// App Store评分
let GotoAppStore: String = "impassioned"
/// 确认申请埋点
let ConfirmApplyBury: String = "horror"

// TODO 替换
let ke_bian_service_address: String = "https://ph01-dc.oss-ap-southeast-6.aliyuncs.com/"
let ke_bina_service_domain: String = "joy-cash/jyc.json"

enum MaiDianEventUploadStyle: String {
    case MD_Login = "1"
    case MD_IDCardAlert = "2"
    case MD_TakingFace = "3"
    case MD_PersonalInfo = "4"
    case MD_JobInfo = "5"
    case MD_LianXiRenInfo = "6"
    case MD_BankInfo = "7"
    case MD_StartApply = "8"
    case MD_EndAppply = "9"
}

enum ShouYeElement: String {
    case BigpwjsuCard = "own"
    case SmallalsowCard = "chateau"
    case ProductskkList = "valley"
}

enum ChanPinAuthElement: String {
    case Certif_ID_Cosujward = "the"
    case Certif_Persopalsjnal_Inuywjfo = "hastily"
    case Certif_Job_Info = "his"
    case Certif_Contesdkcts = "had"
    case Certif_BankkskCard = "dying"
}

enum RenZhengElemeent: String {
    case RZ_Enum = "marriage"
    case RZ_Text = "neither"
    case RZ_City = "tears"
    case RZ_Time = "economicc"
}

let APP_SETTING: String = "digital://bit.byte.code/sighs"
let APP_HOME: String = "digital://bit.byte.code/resign"
let APP_LOGIN: String = "digital://bit.byte.code/informed"
let APP_ORDER: String = "digital://bit.byte.code/these"
let APP_PRODUCT: String = "digital://bit.byte.code/she"
let APP_CALCULATE: String = "digital://bit.byte.code/jisuanqi"
