//
//  LoaskwmDetasilwViewController.swift
//  PintarDom
//
//  Created by Yu Chen  on 2025/11/14.
//

import UIKit

class LoaskwmDetasilwViewController: EsensiilsadwsiwViewController {

    private var chans_number: String?
    private lazy var appslwkView: HomApslwlkControwlView = HomApslwlkControwlView(frame: CGRectZero)
    private lazy var authCollwsoView: UICollectionView = {
        let layosuw: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layosuw.itemSize = CGSize(width: (jk_kScreenW - 70) * 0.5, height: 130)
        layosuw.minimumLineSpacing = 10
        layosuw.minimumInteritemSpacing = 10
        layosuw.sectionInset = UIEdgeInsets(top: 20, left: 14, bottom: 20, right: 14)
        let view = UICollectionView(frame: CGRectZero, collectionViewLayout: layosuw)
        view.backgroundColor = UIColor.init(white: 1, alpha: 0.4)
        view.corner(16)
        return view
    }()
    
    private lazy var bowksiwView: ChanswjBottosnwView = ChanswjBottosnwView(frame: CGRectZero)
    
    private var _colslw_source: [Protector] = []
    private var _p_uelws: String?
    // 下一步认证项
    private var _next_auth: Clearest?
    // 产品信息
    private var _chansi_indos: Idea?
    private var _isRefresh: Bool = false
    private var _titles_map: [ChanPinAuthElement: [String: String]] = [:]
    
    init(chansNumber num: String? = nil) {
        super.init(nibName: nil, bundle: nil)
        
        self.chans_number = num
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.basicScrollContentView.refresh(begin: true)
    }
    
    override func buildPageUI() {
        super.buildPageUI()
        self.bgImgView.image = UIImage(named: "home_bg")
        self.title = APPLanguageInsTool.loadLanguage("details_nav")
        
        self.bowksiwView.appBtn.addTarget(self, action: #selector(clsikwapslwButosnw(sender: )), for: UIControl.Event.touchUpInside)
        self.bowksiwView.protcoplView.protocolDelegate = self
        
        self.authCollwsoView.delegate = self
        self.authCollwsoView.dataSource = self
        self.authCollwsoView.register(AuthskwkCeolllslwCell.self, forCellWithReuseIdentifier: AuthskwkCeolllslwCell.className())
        
        self.basicScrollContentView.addSubview(self.appslwkView)
        self.basicScrollContentView.addSubview(self.authCollwsoView)
        self.view.addSubview(self.bowksiwView)
        
        self.basicScrollContentView.addMJRefresh {[weak self] _ in
            self?.pageNetRequest()
        }
        
        self.basicScrollContentView.refresh(begin: true)
    }
    
    override func layoutPageViews() {
        super.layoutPageViews()
        
        self.basicScrollContentView.snp.remakeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.equalToSuperview().offset(jk_kStatusBarFrameH)
            make.bottom.equalTo(self.bowksiwView.snp.top).offset(-8)
        }
        
        self.appslwkView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(12)
            make.top.equalToSuperview().offset(jk_kStatusBarFrameH)
            make.width.equalTo(jk_kScreenW - 32)
        }
        
        self.authCollwsoView.snp.makeConstraints { make in
            make.left.width.equalTo(self.appslwkView)
            make.top.equalTo(self.appslwkView.snp.bottom).offset(12)
            make.height.greaterThanOrEqualTo(0.1)
        }
        
        self.bowksiwView.snp.makeConstraints { make in
            make.horizontalEdges.bottom.equalToSuperview()
        }
    }

    override func pageNetRequest() {
        super.pageNetRequest()
        guard let _id = self.chans_number else {
            return
        }
        
        self._isRefresh = true
        APPNetRequestManager.afnReqeustType(
            NetworkRequestConfig.defaultRequestConfig("qscgy/calmed", requestParams: ["nor": _id])
        ) { [weak self] (task: URLSessionDataTask, res: APPSuccessResponse) in
            
            self?._isRefresh = false
            guard let self = self else { return }
            self.basicScrollContentView.refresh(begin: false)
            
            guard
                let json = res.jsonDict,
                let models = AuthtiemsModel.model(with: json)
            else {
                return
            }
            
            // MARK: 处理 idea
            if let idea = models.idea {
                self.appslwkView.reloadPswDetailsw(modls: idea)
                self.bowksiwView.appBtn.setTitle(idea.protect, for: .normal)
                self._chansi_indos = idea
                GLoskwCommenskwmodls.shared.productOrderNum = idea.comparatively
                GLoskwCommenskwmodls.shared.productID = idea.bosom
                GLoskwCommenskwmodls.shared.productAmount = idea.dangers
            }
            
            // MARK: 处理 protector
            if let protector = models.protector {
                self._colslw_source.removeAll()
                self._colslw_source.append(contentsOf: protector)
                self.authCollwsoView.reloadData()
                
                for (index, item) in protector.enumerated() {
                    if let _sqls = item.opposing, let _key = ChanPinAuthElement(rawValue: _sqls) {
                        var pp: [String: String] = [:]
                        pp["title"] = item.teach ?? ""
                        pp["des"] = String(format: "%@+%@", String(format: APPLanguageInsTool.loadLanguage("details_step"), (index + 1)), item.conjuring ?? "")
                        pp["progress"] = "\(index + 1)/\(protector.count)"
                        self._titles_map[_key] = pp
                    }
                }
                
                let count = protector.count
                let columns = (count + 1) / 2
                let spacing = columns - 1
                let height: CGFloat = 130 * CGFloat(columns) + 10.0 * CGFloat(spacing) + 40
                self.reloadLayousjw(height: height)
            }
            
            // MARK: 处理 assume
            if let assume = models.assume,
               let teach = assume.teach
            {
                self.bowksiwView.showProtocolViews(psiwsw: teach)
                self._p_uelws = assume.stopping
            }
            
            self._next_auth = models.clearest

        } failure: { [weak self] _, _ in
            self?._isRefresh = false
            self?.basicScrollContentView.refresh(begin: false)
        }
    }
    
    func reloadLayousjw(height: CGFloat) {
        UIView.animate(withDuration: 0.3) {
            self.authCollwsoView.snp.remakeConstraints { make in
                make.left.width.equalTo(self.appslwkView)
                make.top.equalTo(self.appslwkView.snp.bottom).offset(12)
                make.height.equalTo(height)
            }
            
            self.basicScrollContentView.layoutIfNeeded()
        }
    }
    
    func tiaoZhuanAuthitem(_ authThsw: ChanPinAuthElement, h5urls: String? = nil, authTiles: String?) {
        if let _j5 = h5urls {
            LuyouswkMakswTool.luYou.tiaoZhuanPage(luyouUrl: _j5)
        } else {
            switch authThsw {
            case .Certif_ID_Cosujward:
                self.navigationController?.pushViewController(IDCardswAuthExtensiwksViewController(cerasauAutheTiel: authTiles, nexjsAujwTheielw: self._titles_map, authStyle: (ChanPinAuthElement.Certif_ID_Cosujward, ChanPinAuthElement.Certif_Persopalsjnal_Inuywjfo)), animated: true)
            case .Certif_Persopalsjnal_Inuywjfo:
                self.navigationController?.pushViewController(IDCardswAuthExtensiwksViewController(cerasauAutheTiel: authTiles, nexjsAujwTheielw: self._titles_map, authStyle: (ChanPinAuthElement.Certif_Persopalsjnal_Inuywjfo, ChanPinAuthElement.Certif_Job_Info)), animated: true)
            case .Certif_Job_Info:
                self.navigationController?.pushViewController(IDCardswAuthExtensiwksViewController(cerasauAutheTiel: authTiles, nexjsAujwTheielw: self._titles_map, authStyle: (ChanPinAuthElement.Certif_Job_Info, ChanPinAuthElement.Certif_Contesdkcts)), animated: true)
            case .Certif_Contesdkcts:
                self.navigationController?.pushViewController(IDCardswAuthExtensiwksViewController(cerasauAutheTiel: authTiles, nexjsAujwTheielw: self._titles_map, authStyle: (ChanPinAuthElement.Certif_Contesdkcts, ChanPinAuthElement.Certif_BankkskCard)), animated: true)
            case .Certif_BankkskCard:
                self.navigationController?.pushViewController(IDCardswAuthExtensiwksViewController(cerasauAutheTiel: authTiles, nexjsAujwTheielw: self._titles_map, authStyle: (ChanPinAuthElement.Certif_BankkskCard, ChanPinAuthElement.Certif_BankkskCard)), animated: true)
            }
        }
    }
}

extension LoaskwmDetasilwViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self._colslw_source.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let _cell = collectionView.dequeueReusableCell(withReuseIdentifier: AuthskwkCeolllslwCell.className(), for: indexPath) as? AuthskwkCeolllslwCell else {
            return UICollectionViewCell()
        }
        
        let slwks: Protector = self._colslw_source[indexPath.item]
        slwks.index = indexPath
        _cell.reloadOClslwj(model: slwks)
        
        return _cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard !self._isRefresh else {
            return
        }
        
        let _doel = self._colslw_source[indexPath.item]
        var _c_typw: ChanPinAuthElement = ChanPinAuthElement(rawValue: _doel.opposing ?? "") ?? ChanPinAuthElement.Certif_ID_Cosujward
        var title: String? = _doel.teach
        
        // 如果有认证项，优先跳转未认证
        if _doel.recall == "0", let _nex = self._next_auth {
            _c_typw = ChanPinAuthElement(rawValue: _nex.opposing ?? "") ?? ChanPinAuthElement.Certif_ID_Cosujward
            title = _nex.teach
        }
        
        self.tiaoZhuanAuthitem(_c_typw, authTiles: title)
    }
}

@objc private extension LoaskwmDetasilwViewController {
    func clsikwapslwButosnw(sender: APPActivityButton) {
        guard !self._isRefresh else {
            return
        }
        
        if let _nex = self._next_auth {
            self.tiaoZhuanAuthitem(ChanPinAuthElement(rawValue: _nex.opposing ?? "") ?? ChanPinAuthElement.Certif_ID_Cosujward , authTiles: _nex.teach)
            return
        }
        
        if !self.bowksiwView.protcoplView.isHidden && !self.bowksiwView.protcoplView.hasSelected {
            self.view.makeToast(APPLanguageInsTool.loadLanguage("info_confirm_tip"))
            return
        }
        
        sender.startAnimation()
        self.refreshMineLocations()
        guard let _order = GLoskwCommenskwmodls.shared.productOrderNum, let _amouwj = GLoskwCommenskwmodls.shared.productAmount else {
            return
        }
        
        var params: [String : String] = ["comparatively": _order, "dangers": _amouwj]
        if let _p1 = self._chansi_indos?.trifling {
            params["trifling"] = _p1
        }
        
        if let _p2 = self._chansi_indos?.clearly {
            params["clearly"] = _p2
        }
        
        APPNetRequestManager.afnReqeustType(NetworkRequestConfig.defaultRequestConfig("qscgy/earnestly", requestParams: params)) { [weak self] (task: URLSessionDataTask, res :APPSuccessResponse) in
            sender.stopAnimation()
            guard let _jskw = res.jsonDict, let _uwlsw = _jskw["totally"] as? String else {
                return
            }
            
            LuyouswkMakswTool.luYou.tiaoZhuanPage(luyouUrl: _uwlsw, needBackRoot: _uwlsw.hasPrefix("http"))
            self?.buryingStartTime = Date().jk.dateToTimeStamp()
            MaiDianwkToslwTool.fengKongMaidian(type: MaiDianEventUploadStyle.MD_StartApply, beginTime: self?.buryingStartTime, endTime: self?.buryingStartTime, orderNumber: _order)
            
        } failure: { _, _ in
            sender.stopAnimation()
        }
    }
}

extension LoaskwmDetasilwViewController: APPProtocolDelegate {
    func gotoProtocol() {
        if let _pwp = self._p_uelws {
            LuyouswkMakswTool.luYou.tiaoZhuanPage(luyouUrl: _pwp)
        }
    }
}
