//
//  MeSkwoledkwlViewController.swift
//  PintarDom
//
//  Created by 一刻 on 2025/11/13.
//

import UIKit

class MeSkwoledkwlViewController: EsensiilsadwsiwViewController {

    private lazy var gradiensView: GradientColorView = {
        let vew = GradientColorView()
        vew.buildGradientWithColors(gradientColors: [UIColor.hexStringColor(hexString: "#72FFE4", alpha: 0.2), UIColor.hexStringColor(hexString: "#3FE2FF", alpha: 0.2)], gradientStyle: GradientDirectionStyle.leftToRight)
        vew.corner(16)
        return vew
    }()
    
    private lazy var phoneLabsse: UILabel = UILabel.normalTextLabel("", t_color: UIColor.ppBlack33, t_f: UIFont.boldSystemFont(ofSize: 20))
    private lazy var weslwjSmwms: UILabel = UILabel.normalTextLabel(String(format: APPLanguageInsTool.loadLanguage("home_tip"), Bundle.jk.appDisplayName), t_color: UIColor.hexStringColor(hexString: "#666666"), t_f: UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.medium))
    private lazy var lrfsuwImgView: UIImageView = UIImageView(image: UIImage(named: "mine_des"))
    private lazy var headerwImgView: UIImageView = UIImageView(image: UIImage(named: "avatar"))
    private lazy var tip1lans: UILabel = UILabel(frame: CGRectZero)
    private lazy var tip2lans: UILabel = UILabel(frame: CGRectZero)
    private lazy var tip3lans: UILabel = UILabel(frame: CGRectZero)
    private lazy var contakswView: UIView = {
        let view = UIView(frame: CGRect(origin: CGPointZero, size: CGSizeMake(jk_kScreenW, jk_kScreenH - 100 - jk_kNavFrameH - jk_kTabbarFrameH)))
        view.backgroundColor = UIColor.init(white: 1, alpha: 0.35)
        return view
    }()
    
    private var _source: [MenuItem] = []
    
    override func buildPageUI() {
        super.buildPageUI()
        self.title = APPLanguageInsTool.loadLanguage("me_nav")
        self.bgImgView.image = UIImage(named: "mine_bg")
        
        self.contakswView.jk.addCorner(conrners: [.topLeft, .topRight], radius: 16)
        
        self.tip1lans.attributedText = crekskTipwattiskw(APPLanguageInsTool.loadLanguage("me_tip1"), imasgwName: "login_sel")
        self.tip2lans.attributedText = crekskTipwattiskw(APPLanguageInsTool.loadLanguage("me_tip2"), imasgwName: "login_sel")
        self.tip3lans.attributedText = crekskTipwattiskw(APPLanguageInsTool.loadLanguage("me_tip3"), imasgwName: "login_sel")
        
        self.basicScrollContentView.addSubview(self.gradiensView)
        self.gradiensView.addSubview(self.phoneLabsse)
        self.gradiensView.addSubview(self.weslwjSmwms)
        self.gradiensView.addSubview(self.lrfsuwImgView)
        self.gradiensView.addSubview(self.headerwImgView)
        self.basicScrollContentView.addSubview(self.tip1lans)
        self.basicScrollContentView.addSubview(self.tip2lans)
        self.basicScrollContentView.addSubview(self.tip3lans)
        self.basicScrollContentView.addSubview(self.contakswView)
        
        self.basicScrollContentView.addMJRefresh { _ in
            self.pageNetRequest()
        }
        
        GLoskwCommenskwmodls.shared.addObserver(self, forKeyPath: LOGIN_OBERVER_KEY, context: nil)
        self.basicScrollContentView.refresh(begin: true)
    }

    override func layoutPageViews() {
        super.layoutPageViews()
        
        self.basicScrollContentView.snp.remakeConstraints { make in
            make.horizontalEdges.bottom.equalToSuperview()
            make.top.equalToSuperview().offset(jk_kNavFrameH)
        }
        
        self.gradiensView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.top.equalToSuperview()
            make.width.equalTo(jk_kScreenW - 32)
        }
        
        self.phoneLabsse.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(22)
            make.top.equalToSuperview().offset(11)
        }
        
        self.weslwjSmwms.snp.makeConstraints { make in
            make.left.equalTo(self.phoneLabsse)
            make.top.equalTo(self.phoneLabsse.snp.bottom).offset(4)
        }
        
        self.headerwImgView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-35)
            make.size.equalTo(50)
            make.verticalEdges.equalToSuperview().inset(10)
        }
        
        self.lrfsuwImgView.snp.makeConstraints { make in
            make.top.equalTo(self.headerwImgView)
            make.right.equalTo(self.headerwImgView.snp.left).offset(-3)
        }
        
        self.tip1lans.snp.makeConstraints { make in
            make.left.equalTo(self.gradiensView)
            make.top.equalTo(self.gradiensView.snp.bottom).offset(12)
        }
        
        self.tip2lans.snp.makeConstraints { make in
            make.left.equalTo(self.tip1lans)
            make.top.equalTo(self.tip1lans.snp.bottom).offset(14)
        }
        
        self.tip3lans.snp.makeConstraints { make in
            make.left.equalTo(self.tip2lans)
            make.top.equalTo(self.tip2lans.snp.bottom).offset(14)
        }
        
        self.contakswView.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(self.view)
            make.top.equalTo(self.tip3lans.snp.bottom).offset(16)
            make.height.equalTo(jk_kScreenH - 100 - jk_kNavFrameH - jk_kTabbarFrameH)
            make.bottom.equalToSuperview().offset(-20)
        }
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if let _kswis = keyPath, _kswis == LOGIN_OBERVER_KEY {
            if let _syws = GLoskwCommenskwmodls.shared.appLoginInfo?.next {
                self.phoneLabsse.text = _syws.maskPhoneNumber()
            }
        }
    }
    
    override func pageNetRequest() {
        super.pageNetRequest()
        APPNetRequestManager.afnReqeustType(NetworkRequestConfig.defaultRequestConfig("qscgy/faintly", requestParams: [:])) {[weak self] (task: URLSessionDataTask, res: APPSuccessResponse) in
            guard let _skwks = res.jsonDict, let _msoelw = MineskwOpskwModel.model(with: _skwks) else {
                return
            }
            
            self?.basicScrollContentView.refresh(begin: false)
            
            if let _smw = _msoelw.slowly {
                self?._source.removeAll()
                self?._source.append(contentsOf: _smw)
                self?.buildItemCells()
            }
            
        } failure: {[weak self] _, _ in
            self?.basicScrollContentView.refresh(begin: false)
        }
    }
    
    func buildItemCells() {
        self.contakswView.subviews.forEach { (item: UIView) in
            if item is MineItemCelswkViews {
                item.removeFromSuperview()
            }
        }
        
        var tempView: MineItemCelswkViews?
        
        self._source.enumerated().forEach { (index, element) in
            let view = MineItemCelswkViews(frame: CGRectZero)
            if let _ur_te = element.conveying, let _url = URL(string: _ur_te) {
                view.leftimsgeView.setImageWith(_url, options: YYWebImageOptions.setImageWithFadeAnimation)
            }
            view.jumpUrl = element.totally
            view.addTarget(self, action: #selector(clickCellItems(sender: )), for: UIControl.Event.touchUpInside)
            view.titleLabsw.text = element.teach
            self.contakswView.addSubview(view)
            
            if let _tep = tempView {
                view.snp.makeConstraints { make in
                    make.horizontalEdges.equalTo(_tep)
                    make.top.equalTo(_tep.snp.bottom).offset(10)
                }
            } else {
                view.snp.makeConstraints { make in
                    make.horizontalEdges.equalToSuperview().inset(16)
                    make.top.equalToSuperview().offset(16)
                }
            }
            
            tempView = view
        }
    }
    
    func crekskTipwattiskw(_ text: String, imasgwName: String) -> NSAttributedString {
        let attswks: NSMutableAttributedString = NSMutableAttributedString(string: " \(text)", attributes: [.font: UIFont.systemFont(ofSize: 13, weight: UIFont.Weight.medium), .foregroundColor: UIColor.hexStringColor(hexString: "#0972A4")])
        if let _im = UIImage(named: imasgwName) {
            let attmens: NSTextAttachment = NSTextAttachment(image: _im)
            attmens.bounds = CGRect(origin: CGPoint(x: 0, y: -3), size: _im.size)
            attswks.insert(NSAttributedString(attachment: attmens), at: 0)
        }
        
        return attswks
    }
}

@objc private extension MeSkwoledkwlViewController {
    func clickCellItems(sender: MineItemCelswkViews) {
        if let _url = sender.jumpUrl {
            LuyouswkMakswTool.luYou.tiaoZhuanPage(luyouUrl: _url, needBackRoot: true)
        }
    }
}
