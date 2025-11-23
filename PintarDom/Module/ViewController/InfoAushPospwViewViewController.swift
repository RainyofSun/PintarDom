//
//  InfoAushPospwViewViewController.swift
//  PintarDom
//
//  Created by 一刻 on 2025/11/23.
//

import UIKit

enum InfoCheskwStyle {
    case PersonalInfo
    case WorkInfo
    case BankInfo
}

class InfoAushPospwViewViewController: AuthExtensiwksViewController {

    private var info_cache: (requesUrl: String, saveUrl: String, style: InfoCheskwStyle)?
    private var info_key_cahce: [String: String] = [:]
    private var _ensInfo: ChanPinAuthElement = .Certif_Persopalsjnal_Inuywjfo
    
    override init(cerasauAutheTiel title: String?, nexjsAujwTheielw next: [ChanPinAuthElement : [String : String]]? = nil, authStyle style: (current: ChanPinAuthElement, next: ChanPinAuthElement)) {
        super.init(cerasauAutheTiel: title, nexjsAujwTheielw: next, authStyle: style)
        if style.current == .Certif_Persopalsjnal_Inuywjfo {
            self.info_cache = ("qscgy/blank", "qscgy/behold", InfoCheskwStyle.PersonalInfo)
        }
        
        if style.current == .Certif_Job_Info {
            self.info_cache = ("qscgy/next", "qscgy/difference", InfoCheskwStyle.WorkInfo)
        }
        
        if style.current == .Certif_BankkskCard {
            self.info_cache = ("qscgy/recall", "qscgy/able", InfoCheskwStyle.BankInfo)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func pageNetRequest() {
        super.pageNetRequest()
        guard let _id = GLoskwCommenskwmodls.shared.productID, let _tupe = self.info_cache else {
            return
        }
        
        APPNetRequestManager.afnReqeustType(NetworkRequestConfig.defaultRequestConfig(_tupe.requesUrl, requestParams: ["nor": _id])) { [weak self] (task: URLSessionDataTask, res: APPSuccessResponse) in
            guard let _dskw = res.jsonDict, let _indow_model = InfoAuthComskwModel.model(with: _dskw) else {
                return
            }
            
            
        }
    }
}
