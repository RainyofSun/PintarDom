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
    
    override func buildPageUI() {
        super.buildPageUI()
        self.bgImgView.image = UIImage(named: "mine_bg")
        self.title = APPLanguageInsTool.loadLanguage("calcular_nav")
        self.gradientView.isHidden = false
        self.gradientView.buildGradientWithColors(gradientColors: [UIColor.hexStringColor(hexString: "#21F0E8"), UIColor.hexStringColor(hexString: "#3BF8FF", alpha: 0.63)], gradientStyle: GradientDirectionStyle.leftTopToRightBottom)
        
        let paysaq: NSMutableParagraphStyle = NSMutableParagraphStyle()
        paysaq.paragraphSpacing = 8
        let titleSqqwi: NSMutableAttributedString = NSMutableAttributedString(string: String(format: "%@\n", APPLanguageInsTool.loadLanguage("calcular_tip1")), attributes: [.font: UIFont.loadSpecialFont(size: 18, ftStyle: FontStyle.Arial_BoldMT), .foregroundColor: UIColor.white, .paragraphStyle: paysaq])
        titleSqqwi.append(NSAttributedString(string: APPLanguageInsTool.loadLanguage("calcular_tip2"), attributes: [.font: UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.medium), .foregroundColor: UIColor.white]))
        self.topTilsLab.attributedText = titleSqqwi
        
        self.view.addSubview(self.topBcosnView)
        self.view.insertSubview(self.whiteBgView, belowSubview: self.basicScrollContentView)
        self.topBcosnView.addSubview(self.topTilsLab)
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
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.whiteBgView.jk.addCorner(conrners: [.bottomLeft, .bottomRight], radius: 16)
        self.topBcosnView.jk.addCorner(conrners: [.topLeft, .topRight], radius: 16)
    }
}
