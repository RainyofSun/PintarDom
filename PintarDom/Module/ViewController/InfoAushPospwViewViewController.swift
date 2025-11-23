//
//  InfoAushPospwViewViewController.swift
//  PintarDom
//
//  Created by 一刻 on 2025/11/23.
//

import UIKit

class InfoAushPospwViewViewController: AuthExtensiwksViewController {

    private var info_cache: (requesUrl: String, saveUrl: String, style: MaiDianEventUploadStyle)?
    private var info_key_cahce: [String: String] = [:]
    private var _ensInfo: ChanPinAuthElement = .Certif_Persopalsjnal_Inuywjfo
    
    override init(cerasauAutheTiel title: String?, nexjsAujwTheielw next: [ChanPinAuthElement : [String : String]]? = nil, authStyle style: (current: ChanPinAuthElement, next: ChanPinAuthElement)) {
        super.init(cerasauAutheTiel: title, nexjsAujwTheielw: next, authStyle: style)
        if style.current == .Certif_Persopalsjnal_Inuywjfo {
            self.info_cache = ("qscgy/blank", "qscgy/behold", MaiDianEventUploadStyle.MD_PersonalInfo)
        }
        
        if style.current == .Certif_Job_Info {
            self.info_cache = ("qscgy/next", "qscgy/difference", MaiDianEventUploadStyle.MD_JobInfo)
        }
        
        if style.current == .Certif_BankkskCard {
            self.info_cache = ("qscgy/recall", "qscgy/able", MaiDianEventUploadStyle.MD_BankInfo)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func pageNetRequest() {
        super.pageNetRequest()
        guard let _tupe = self.info_cache else {
            return
        }
        
        APPNetRequestManager.afnReqeustType(NetworkRequestConfig.defaultRequestConfig(_tupe.requesUrl, requestParams: ["nor": self.comsejDityID])) { [weak self] (task: URLSessionDataTask, res: APPSuccessResponse) in
            guard let _dskw = res.jsonDict, let _indow_model = InfoAuthComskwModel.model(with: _dskw), let _lslq = _indow_model.land else {
                return
            }
            
            self?.buildInfoAuthwIsnw(source: _lslq)
        }
    }
    
    override func clickNextButtons(sender: APPActivityButton) {
        super.clickNextButtons(sender: sender)
        guard let _tupw = self.info_cache else {
            return
        }
        
        self.info_key_cahce["nor"] = self.comsejDityID
        sender.startAnimation()
        
        APPCocoaLog.debug("------ \n ---------\(self.info_key_cahce) \n----------")
        
        APPNetRequestManager.afnReqeustType(NetworkRequestConfig.defaultRequestConfig(_tupw.requesUrl, requestParams: self.info_key_cahce)) { [weak self] (task: URLSessionDataTask, res: APPSuccessResponse) in
            sender.stopAnimation()
            guard let __sselfw = self else {
                return
            }
            
            MaiDianwkToslwTool.fengKongMaidian(type: _tupw.style, beginTime: __sselfw.buryingStartTime, endTime: Date().jk.dateToTimeStamp())
            if __sselfw._next_type == ChanPinAuthElement.Certif_Job_Info, let _title = __sselfw._next_tilskw_map?[__sselfw._next_type]?["title"] {
                __sselfw.navigationController?.jk.popCurrentAndPush(vc: InfoAushPospwViewViewController(cerasauAutheTiel: _title, nexjsAujwTheielw: __sselfw._next_tilskw_map, authStyle: (__sselfw._next_type, ChanPinAuthElement.Certif_Contesdkcts)), animated: true)
            }
            
            if __sselfw._type == ChanPinAuthElement.Certif_Contesdkcts, let _title = __sselfw._next_tilskw_map?[__sselfw._next_type]?["title"] {
                __sselfw.navigationController?.jk.popCurrentAndPush(vc: ContactswkVosruejdViewController(cerasauAutheTiel: _title, nexjsAujwTheielw: __sselfw._next_tilskw_map, authStyle: (__sselfw._next_type, ChanPinAuthElement.Certif_BankkskCard)), animated: true)
            }
            
            if __sselfw._next_type == ChanPinAuthElement.Certif_BankkskCard {
                __sselfw.navigationController?.popViewController(animated: true)
            }
        } failure: { _, _ in
            sender.stopAnimation()
        }
    }
}

private extension InfoAushPospwViewViewController {
    func buildInfoAuthwIsnw(source: [Land]) {
        var tempInfo: InfoAuthItemView?
        
        source.enumerated().forEach { (index, element) in
            let view = InfoAuthItemView(frame: CGRectZero, inputStyle: RenZhengElemeent.init(rawValue: element.solely ?? "") ?? .RZ_Enum)
            if let _key = element.fainter, let _chose = element.uttered {
                view.itenChose = (_key, _chose)
                
                if let _text = element.sighed {
                    view.tesjwtextFiedwView.text = _text
                    self.info_key_cahce[_key] = _text
                }
            }
            
            view.inputDelesjuw = self
            
            self.basicScrollContentView.addSubview(view)
            
            if let _tt = tempInfo {
                if index == source.count - 1 {
                    view.snp.makeConstraints { make in
                        make.horizontalEdges.equalTo(_tt)
                        make.top.equalTo(_tt.snp.bottom).offset(12)
                        make.bottom.equalToSuperview().offset(-12)
                    }
                } else {
                    view.snp.makeConstraints { make in
                        make.horizontalEdges.equalTo(_tt)
                        make.top.equalTo(_tt.snp.bottom).offset(12)
                    }
                }
            } else {
                view.snp.makeConstraints { make in
                    make.left.equalTo(12)
                    make.width.equalTo(jk_kScreenW - 56)
                    make.top.equalToSuperview().offset(12)
                }
            }
            
            tempInfo = view
        }
    }
}

extension InfoAushPospwViewViewController: InfoAuthCompelwProtocol {
    func toushInfoItem(itemView: UIView) {
        guard let _info_view = itemView as? InfoAuthItemView else {
            return
        }
        
        self.view.endEditing(true)
        guard let _chose = _info_view.itenChose?.chosse, let _key = _info_view.itenChose?.cacheKey else {
            return
        }
        
        if _info_view.renzhenSylesk == .RZ_Enum {
            let view: InfoAuthItemSinglePickerView = InfoAuthItemSinglePickerView(frame: UIScreen.main.bounds)
            view.reloadSindlwPickerViews(moelsw: _chose)
            UIDevice.current.keyWindow().addSubview(view)
            view.clickConfirmClosure = {[weak self] (psowp: EsensiwlwsBadisnPresentView, sender: APPActivityButton) in
                guard let _psow = psowp as? InfoAuthItemSinglePickerView else {
                    return
                }
                
                if let _codes = _psow.selcjesGosw?.fainted {
                    self?.info_key_cahce[_key] = _codes
                }
                
                _info_view.tesjwtextFiedwView.text = _psow.selcjesGosw?.able
                
                psowp.dismissPop()
            }
            
            view.showPresent()
        }
        
        if _info_view.renzhenSylesk == .RZ_Time {
            let picker: CardAuthwTimePiswView = CardAuthwTimePiswView(frame: UIScreen.main.bounds)
            UIDevice.current.keyWindow().addSubview(picker)
            picker.showPresent()
            
            picker.clickConfirmClosure = { [weak self] (pospwView: EsensiwlwsBadisnPresentView, sender: APPActivityButton) in
                guard let _pp = pospwView as? CardAuthwTimePiswView, let _date = _pp.selectedDate else {
                    return
                }
                
                self?.info_key_cahce[_key] = _date
                _info_view.tesjwtextFiedwView.text = _date
                
                _pp.dismissPop()
            }
        }
    }
    
    func didEndEditeing(itemsiw: UIView, inputsw: String?) {
        guard let _info_view = itemsiw as? InfoAuthItemView else {
            return
        }
        
        guard let _key = _info_view.itenChose?.cacheKey else {
            return
        }
        
        if let _tt = inputsw {
            self.info_key_cahce[_key] = _tt
        }
    }
}
