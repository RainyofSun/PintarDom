//
//  CalculateowlswViewController.swift
//  PintarDom
//
//  Created by 一刻 on 2025/11/25.
//

import UIKit

class CalculateowlswViewController: EsensiilsadwsiwViewController {

    private lazy var topBcosnView: GradientColorView = {
        let view = GradientColorView(frame: CGRectZero)
        view.buildGradientWithColors(gradientColors: [UIColor.hexStringColor(hexString: "#0DA2F5"), UIColor.hexStringColor(hexString: "#0DF5A2", alpha: 0)], gradientStyle: GradientDirectionStyle.leftTopToRightBottom)
        view.frame = CGRect(origin: CGPointZero, size: CGSizeMake(jk_kScreenW - 32, 90))
        return view
    }()

    private lazy var whiteBgView: UIView = {
        let view = UIView(frame: CGRectZero)
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var topTilsLab: UILabel = {
        let view = UILabel(frame: CGRectZero)
        view.numberOfLines = 0
        return view
    }()
    
    private lazy var amountView = InfoAuthItemView(frame: CGRectZero, inputStyle: RenZhengElemeent.RZ_Text)
    private lazy var rateView = InfoAuthItemView(frame: CGRectZero, inputStyle: RenZhengElemeent.RZ_Enum)
    private lazy var timeView = CalaulateRateVkskwItemView(frame: CGRectZero)
    
    private(set) lazy var appBtn: APPActivityButton = {
        let view = APPActivityButton.buildLoadingAnimationButton(title: "calcular_btn")
        view.corner(25)
        return view
    }()
    
    private lazy var resetBtn: UIButton = {
        let view = UIButton(type: UIButton.ButtonType.custom)
        view.setTitle(APPLanguageInsTool.loadLanguage("calcular_reset"), for: UIControl.State.normal)
        view.setTitleColor(UIColor.ppBlack33, for: UIControl.State.normal)
        view.titleLabel?.font = UIFont.loadSpecialFont(size: 16, ftStyle: FontStyle.Inter_Medium)
        return view
    }()
    
    private lazy var resultView = CalaulateResultswpeView(frame: CGRectZero)
    
    override func buildPageUI() {
        super.buildPageUI()
        
        self.title = APPLanguageInsTool.loadLanguage("calcular_nav")
        self.gradientView.isHidden = false
        self.gradientView.buildGradientWithColors(gradientColors: [UIColor.hexStringColor(hexString: "#21F0E8"), UIColor.hexStringColor(hexString: "#3BF8FF", alpha: 0.63)], gradientStyle: GradientDirectionStyle.leftTopToRightBottom)
        
        let paysaq: NSMutableParagraphStyle = NSMutableParagraphStyle()
        paysaq.paragraphSpacing = 8
        let titleSqqwi: NSMutableAttributedString = NSMutableAttributedString(string: String(format: "%@\n", APPLanguageInsTool.loadLanguage("calcular_tip1")), attributes: [.font: UIFont.loadSpecialFont(size: 18, ftStyle: FontStyle.Arial_BoldMT), .foregroundColor: UIColor.white, .paragraphStyle: paysaq])
        titleSqqwi.append(NSAttributedString(string: APPLanguageInsTool.loadLanguage("calcular_tip2"), attributes: [.font: UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.medium), .foregroundColor: UIColor.white]))
        self.topTilsLab.attributedText = titleSqqwi
        
        self.amountView.titlesljdlab.text = APPLanguageInsTool.loadLanguage("calcular_tip3")
        self.rateView.titlesljdlab.text = APPLanguageInsTool.loadLanguage("calcular_tip4")
        self.amountView.tesjwtextFiedwView.attributedPlaceholder = NSAttributedString(string: APPLanguageInsTool.loadLanguage("calcular_tip3_place"), attributes: [.foregroundColor: UIColor.hexStringColor(hexString: "#738570"), .font: UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.medium)])
        self.rateView.tesjwtextFiedwView.attributedPlaceholder = NSAttributedString(string: APPLanguageInsTool.loadLanguage("calcular_tip4_place"), attributes: [.foregroundColor: UIColor.hexStringColor(hexString: "#738570"), .font: UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.medium)])
        self.timeView.tesjwtextFiedwView.attributedPlaceholder = NSAttributedString(string: APPLanguageInsTool.loadLanguage("calcular_tip5_place"), attributes: [.foregroundColor: UIColor.hexStringColor(hexString: "#738570"), .font: UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.medium)])
        
        self.appBtn.addTarget(self, action: #selector(clickCalslwBtn(sender: )), for: UIControl.Event.touchUpInside)
        self.resetBtn.addTarget(self, action: #selector(clikcResetButtoen(sender: )), for: UIControl.Event.touchUpInside)
        
        self.view.addSubview(self.topBcosnView)
        self.view.insertSubview(self.whiteBgView, belowSubview: self.basicScrollContentView)
        self.topBcosnView.addSubview(self.topTilsLab)
        self.basicScrollContentView.addSubview(self.amountView)
        self.basicScrollContentView.addSubview(self.rateView)
        self.basicScrollContentView.addSubview(self.timeView)
        self.basicScrollContentView.addSubview(self.appBtn)
        self.basicScrollContentView.addSubview(self.resetBtn)
        self.basicScrollContentView.addSubview(self.resultView)
    }
    
    override func layoutPageViews() {
        super.layoutPageViews()
        
        self.topBcosnView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16)
            make.height.equalTo(90)
            make.top.equalToSuperview().offset(jk_kNavFrameH)
        }
        
        self.topTilsLab.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16)
            make.top.equalToSuperview().offset(20)
        }
        
        self.whiteBgView.snp.makeConstraints { make in
            make.top.equalTo(self.topBcosnView.snp.bottom)
            make.horizontalEdges.equalTo(self.topBcosnView)
            make.bottom.equalToSuperview().offset(-10 - UIDevice.current.keyWindow().safeAreaInsets.bottom)
        }
        
        self.basicScrollContentView.snp.remakeConstraints { make in
            make.edges.equalTo(self.whiteBgView)
        }
        
        self.amountView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.left.width.equalToSuperview()
        }
        
        self.rateView.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(self.amountView)
            make.top.equalTo(self.amountView.snp.bottom).offset(12)
        }
        
        self.timeView.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(self.rateView)
            make.top.equalTo(self.rateView.snp.bottom).offset(12)
        }
        
        self.appBtn.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.top.equalTo(self.timeView.snp.bottom).offset(16)
            make.horizontalEdges.equalTo(self.timeView).inset(10)
        }
        
        self.resetBtn.snp.makeConstraints { make in
            make.height.horizontalEdges.equalTo(self.appBtn)
            make.top.equalTo(self.appBtn.snp.bottom)
        }
        
        self.resultView.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(self.timeView)
            make.top.equalTo(self.resetBtn.snp.bottom).offset(12)
            make.bottom.equalToSuperview().offset(-12)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.whiteBgView.jk.addCorner(conrners: [.bottomLeft, .bottomRight], radius: 16)
        self.topBcosnView.jk.addCorner(conrners: [.topLeft, .topRight], radius: 16)
    }
    
    override func pageNetRequest() {
        super.pageNetRequest()
        
    }
}

@objc private extension CalculateowlswViewController {
    func clickCalslwBtn(sender: APPActivityButton) {
        
    }
    
    func clikcResetButtoen(sender: UIButton) {
        
    }
}
