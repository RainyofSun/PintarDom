//
//  OrderSlwbarViews.swift
//  PintarDom
//
//  Created by Yu Chen on 2025/11/22.
//

import UIKit

protocol ordekSeldekrProtocol: AnyObject {
    func didSelskwkItes(index: Int)
}

class OrderSlwbarViews: UIView {
    
    weak open var slideDelegate: ordekSeldekrProtocol?
    
    // MARK: - UI
    
    private lazy var curskwView: GradientColorView = {
        let view = GradientColorView(frame: .zero)
        view.buildGradientWithColors(
            gradientColors: [
                UIColor.hexStringColor(hexString: "#0DA2F5"),
                UIColor.hexStringColor(hexString: "#0DF5A2")
            ],
            gradientStyle: .leftTopToRightBottom
        )
        view.corner(12)
        return view
    }()
    
    private lazy var repaMentswBtn: UIButton = createButton(titleKey: "order_repay", tag: 206, selected: true)
    private lazy var applsywiBtn: UIButton = createButton(titleKey: "order_applying", tag: 207)
    private lazy var rFiwnswBtn: UIButton = createButton(titleKey: "order_finish", tag: 205)
    private lazy var allswkntswBtn: UIButton = createButton(titleKey: "order_all", tag: 204)
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [
            repaMentswBtn,
            applsywiBtn,
            rFiwnswBtn,
            allswkntswBtn
        ])
        view.axis = .horizontal
        view.alignment = .center
        view.distribution = .fill
        view.spacing = 18 // 默认值，会在 setupAdaptiveSpacing 调整
        return view
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.hexStringColor(hexString: "#70FFE5", alpha: 0.6)
        corner(16)
        
        setupViews()
        setupAdaptiveSpacing()
        setupDefaultCursor()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UI Setup

private extension OrderSlwbarViews {
    
    func setupViews() {
        addSubview(curskwView)
        addSubview(stackView)
        
        stackView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(14)
            make.right.lessThanOrEqualToSuperview().offset(-14)
            make.top.bottom.equalToSuperview().inset(10)
        }
    }
    
    func setupDefaultCursor() {
        curskwView.snp.makeConstraints { make in
            make.centerY.equalTo(repaMentswBtn)
            make.height.equalTo(repaMentswBtn)
            make.left.equalTo(repaMentswBtn).offset(-10)
            make.right.equalTo(repaMentswBtn).offset(10)
        }
    }
    
    // 根据屏幕宽度自适应间距
    func setupAdaptiveSpacing() {
        let screenWidth = UIScreen.main.bounds.width
        let minSpacing: CGFloat = 10
        let maxSpacing: CGFloat = 35
        let minWidth: CGFloat = 320
        let maxWidth: CGFloat = 428
        
        let spacing = minSpacing + (screenWidth - minWidth) / (maxWidth - minWidth) * (maxSpacing - minSpacing)
        stackView.spacing = spacing
    }
    
    func createButton(titleKey: String, tag: Int, selected: Bool = false) -> UIButton {
        let btn = UIButton(type: .custom)
        btn.setTitle(APPLanguageInsTool.loadLanguage(titleKey), for: .normal)
        btn.setTitleColor(.ppBlack33, for: .normal)
        btn.setTitleColor(.white, for: .selected)
        btn.tag = tag
        btn.isSelected = selected
        
        btn.titleLabel?.font = selected
            ? UIFont.loadSpecialFont(size: 15, ftStyle: .Inter_SemiBold)
            : UIFont.loadSpecialFont(size: 16, ftStyle: .Inter_Regular)
        
        btn.addTarget(self, action: #selector(clickSlidekrBurrosnw(sender:)), for: .touchUpInside)
        return btn
    }
}

// MARK: - Logic

extension OrderSlwbarViews {
    
    func cleadStasuw() {
        for case let btn as UIButton in subviews + stackView.arrangedSubviews {
            if btn.isSelected {
                btn.isSelected = false
                btn.titleLabel?.font = UIFont.loadSpecialFont(size: 16, ftStyle: .Inter_Regular)
            }
        }
    }
}

@objc private extension OrderSlwbarViews {
    
    func clickSlidekrBurrosnw(sender: UIButton) {
        cleadStasuw()
        
        sender.isSelected = true
        sender.titleLabel?.font = UIFont.loadSpecialFont(size: 15, ftStyle: .Inter_SemiBold)
        
        UIView.animate(withDuration: 0.3) {
            self.curskwView.snp.remakeConstraints { make in
                make.centerY.equalTo(sender)
                make.height.equalTo(sender)
                make.left.equalTo(sender).offset(-10)
                make.right.equalTo(sender).offset(10)
            }
            self.layoutIfNeeded()
        }
        
        slideDelegate?.didSelskwkItes(index: sender.tag - 200)
    }
}
