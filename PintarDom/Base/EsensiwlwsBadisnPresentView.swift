//
//  EsensiwlwsBadisnPresentView.swift
//  PintarDom
//
//  Created by Yu Chen  on 2025/11/15.
//

import UIKit

class EsensiwlwsBadisnPresentView: UIView {

    open var clickConfirmClosure: ((EsensiwlwsBadisnPresentView, APPActivityButton) -> Void)?
    
    private(set) lazy var contentView: UIImageView = {
        let bgImg = UIImage(named: "login_bg_c")
        let resiceImg = bgImg?.resizableImage(withCapInsets: UIEdgeInsets.init(top: bgImg!.size.height * 0.6, left: 0, bottom: bgImg!.size.height * 0.7, right: 0), resizingMode: UIImage.ResizingMode.stretch)
        
        let view = UIImageView(image: resiceImg)
        view.isUserInteractionEnabled = true
        return view
    }()
    
    private lazy var closeBtn: UIButton = {
        let btn = UIButton(type: UIButton.ButtonType.custom)
        btn.setImage(UIImage(named: "login_close"), for: UIControl.State.normal)
        return btn
    }()
    
    private(set) lazy var confirmBtn: APPActivityButton = {
        let view = APPActivityButton.buildLoadingAnimationNoColorButton(title:APPLanguageInsTool.loadLanguage("auth_pop_confirm_btn"))
        view.setBackgroundImage(UIImage(named: "login_btn_bg"), for: UIControl.State.normal)
        view.setBackgroundImage(UIImage(named: "login_btn_bg"), for: UIControl.State.highlighted)
        view.setBackgroundImage(UIImage(named: "login_btn_bg"), for: UIControl.State.disabled)
        return view
    }()
    
    private(set) lazy var titleLab: UILabel = UILabel.normalTextLabel("", t_color: UIColor.ppBlack33, t_f: UIFont.loadSpecialFont(size: 24, ftStyle: FontStyle.Arial_BoldMT))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.alpha = .zero
        self.backgroundColor = UIColor.init(white: 0, alpha: 0.6)
        
        self.buildPresentView()
        self.layoutPresentView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildPresentView() {
        
        self.closeBtn.addTarget(self, action: #selector(closePresentView), for: UIControl.Event.touchUpInside)
        self.confirmBtn.addTarget(self, action: #selector(confirmClick(sender: )), for: UIControl.Event.touchUpInside)
        self.confirmBtn.corner(16)
        self.addSubview(self.closeBtn)
        self.addSubview(self.contentView)
        self.contentView.addSubview(self.titleLab)
        self.contentView.addSubview(self.confirmBtn)
    }
    
    func layoutPresentView() {
        self.contentView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(50)
            make.centerY.equalToSuperview()
            make.height.greaterThanOrEqualTo(200)
        }
        
        self.closeBtn.snp.makeConstraints { make in
            make.bottom.equalTo(self.contentView.snp.top)
            make.right.equalTo(self.contentView).offset(4)
            make.size.equalTo(25)
        }
        
        self.confirmBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
            make.bottom.equalToSuperview().offset(10)
        }
        
        self.titleLab.snp.makeConstraints { make in
            make.centerX.equalToSuperview().offset(-10)
            make.top.equalToSuperview().offset(30)
        }
    }
    
    @objc func closePresentView() {
        self.dismissPop()
    }
    
    @objc func confirmClick(sender: APPActivityButton) {
        if self.clickConfirmClosure != nil {
            self.clickConfirmClosure?(self, sender)
        }
    }
    
    func showPresent() {
        UIView.animate(withDuration: 0.3) {
            self.alpha = 1
        }
    }
    
    func dismissPop() {
        UIView.animate(withDuration: 0.3) {
            self.alpha = .zero
        } completion: { _ in
            self.removeFromSuperview()
        }
    }

}
