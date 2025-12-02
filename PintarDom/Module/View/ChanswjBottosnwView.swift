//
//  ChanswjBottosnwView.swift
//  PintarDom
//
//  Created by Yu Chen  on 2025/11/22.
//

import UIKit

class ChanswjBottosnwView: UIView {

    private(set) lazy var protcoplView: ProtocolView = {
        let view = ProtocolView(frame: CGRectZero)
        view.setAgreeButton(UIImage(named: "login_unsel")!, selectedImg: UIImage(named: "login_sel")!)
        view.isHidden = true
        return view
    }()
    
    private(set) lazy var appBtn: APPActivityButton = {
        let btn: APPActivityButton = APPActivityButton(type: UIButton.ButtonType.custom)
        btn.setGradientColors([UIColor.hexStringColor(hexString: "#0DF5A2").withAlphaComponent(0.8), UIColor.hexStringColor(hexString: "#0DA2F5").withAlphaComponent(0.8)], style: GradientDirectionStyle.leftBottomToRightTop)
        btn.setTitleColor(UIColor.white, for: UIControl.State.normal)
        btn.titleLabel?.font = UIFont.loadSpecialFont(size: 16, ftStyle: FontStyle.Inter_Medium)
        
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.white
        self.appBtn.corner(23)
        self.addSubview(self.appBtn)
        
        self.appBtn.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(12)
            make.horizontalEdges.equalToSuperview().inset(35)
            make.height.equalTo(46)
            make.bottom.equalToSuperview().offset(-20 - (jk_isIPhoneNotch ? 20 : 0))
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func showProtocolViews(psiwsw: String) {
        if psiwsw.isEmpty {
            return
        }
        
        self.protcoplView.setProtocol(NSAttributedString(string: psiwsw, attributes: [.font: UIFont.loadSpecialFont(size: 14, ftStyle: FontStyle.Inter_Medium),.foregroundColor: UIColor.hexStringColor(hexString: "#0972A4")]), protocolPrefix: NSAttributedString(string: APPLanguageInsTool.loadLanguage("details_agree"), attributes: [.font: UIFont.loadSpecialFont(size: 14, ftStyle: FontStyle.Inter_Medium), .foregroundColor: UIColor.ppBlack33]))
        
        if self.protcoplView.superview == nil {
            self.addSubview(self.protcoplView)
            UIView.animate(withDuration: 0.3) {
                self.protcoplView.snp.remakeConstraints { make in
                    make.top.equalToSuperview().offset(12)
                    make.left.equalTo(self.appBtn)
                }
                
                self.appBtn.snp.remakeConstraints { make in
                    make.top.equalTo(self.protcoplView.snp.bottom).offset(8)
                    make.horizontalEdges.equalToSuperview().inset(35)
                    make.height.equalTo(46)
                    make.bottom.equalToSuperview().offset(-20 - (jk_isIPhoneNotch ? 20 : 0))
                }
                
                self.layoutIfNeeded()
            }
        } else {
            self.protcoplView.removeFromSuperview()
            UIView.animate(withDuration: 0.3) {

                self.appBtn.snp.remakeConstraints { make in
                    make.top.equalToSuperview().offset(12)
                    make.horizontalEdges.equalToSuperview().inset(35)
                    make.height.equalTo(46)
                    make.bottom.equalToSuperview().offset(-20 - (jk_isIPhoneNotch ? 20 : 0))
                }
                
                self.layoutIfNeeded()
            }
        }
    }
}
