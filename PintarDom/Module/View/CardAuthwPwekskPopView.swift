//
//  CardAuthwPwekskPopView.swift
//  PintarDom
//
//  Created by 一刻 on 2025/11/23.
//

import UIKit

class ConsiekwItemView: UIView {
    weak open var inputDelesjuw: InfoAuthCompelwProtocol?
    open var itenKey: String?
    
    private(set) lazy var titlesljdlab: UILabel = UILabel.normalTextLabel("", t_color: UIColor.ppBlack33, t_f: UIFont.loadSpecialFont(size: 16, ftStyle: FontStyle.Inter_Medium))
    private lazy var gradiensView: GradientColorView = {
        let vew = GradientColorView()
        vew.buildGradientWithColors(gradientColors: [UIColor.hexStringColor(hexString: "#72FFE4", alpha: 0.2), UIColor.hexStringColor(hexString: "#3FE2FF", alpha: 0.2)], gradientStyle: GradientDirectionStyle.leftToRight)
        vew.corner(16)
        return vew
    }()
    
    private(set) lazy var arrownsImswh: UIImageView = UIImageView(image: UIImage(named: "setting_more"))
    private(set) lazy var tesjwtextFiedwView: ForbidActionTextFiled = {
        let view = ForbidActionTextFiled(frame: CGRectZero)
        view.borderStyle = .none
        view.textColor = UIColor.ppBlack33
        view.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.medium)
        return view
    }()
    
    private(set) var renzhenSylesk: RenZhengElemeent = RenZhengElemeent.RZ_Text
    
    init(frame: CGRect, inputStyle: RenZhengElemeent) {
        super.init(frame: frame)
        
        self.renzhenSylesk = inputStyle
        self.arrownsImswh.isHidden = inputStyle == .RZ_Text
        self.gradiensView.isUserInteractionEnabled = true
        self.addSubview(self.titlesljdlab)
        self.addSubview(self.gradiensView)
        self.gradiensView.addSubview(self.tesjwtextFiedwView)
        self.gradiensView.addSubview(self.arrownsImswh)
        
        self.tesjwtextFiedwView.delegate = self
        
        self.titlesljdlab.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.top.equalToSuperview()
        }
        
        self.gradiensView.snp.makeConstraints { make in
            make.left.equalTo(self.titlesljdlab)
            make.right.equalToSuperview().offset(-25)
            make.top.equalTo(self.titlesljdlab.snp.bottom).offset(6)
            make.height.equalTo(44)
            make.bottom.equalToSuperview()
        }
        
        self.tesjwtextFiedwView.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview()
            make.left.equalToSuperview().offset(16)
            make.width.equalToSuperview().multipliedBy(0.8)
        }
        
        self.arrownsImswh.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-16)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ConsiekwItemView: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        self.inputDelesjuw?.toushInfoItem(itemView: self)
        return self.renzhenSylesk == .RZ_Text
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.inputDelesjuw?.didEndEditeing(itemsiw: self, inputsw: textField.text)
    }
}

class CardAuthwPwekskPopView: EsensiwlwsBadisnPresentView {
    
    open var savepashw: [String: String] = [:]
    
    private lazy var contenswwlView: UIView = UIView(frame: CGRectZero)
    private lazy var tipLswjs: UILabel = UILabel.normalTextLabel(APPLanguageInsTool.loadLanguage("auth_pop_confirm_tip1"), t_color: UIColor.hexStringColor(hexString: "#F14857"), t_f: UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.medium))
    
    override func buildPresentView() {
        super.buildPresentView()
        
        self.titleLab.text = APPLanguageInsTool.loadLanguage("auth_pop_confirm")
        self.titleLab.font = UIFont.loadSpecialFont(size: 18, ftStyle: FontStyle.Arial_BoldMT)
        
        self.contentView.addSubview(self.contenswwlView)
        self.contentView.addSubview(self.tipLswjs)
    }
    
    override func layoutPresentView() {
        super.layoutPresentView()
        
        self.contenswwlView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-25)
            make.top.equalTo(self.titleLab.snp.bottom).offset(30)
            make.height.greaterThanOrEqualTo(1)
        }
        
        self.tipLswjs.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(self.contenswwlView)
            make.top.equalTo(self.contenswwlView.snp.bottom).offset(9)
        }
        
        self.confirmBtn.snp.remakeConstraints { make in
            make.height.equalTo(50)
            make.centerX.equalTo(self.contenswwlView)
            make.top.equalTo(self.tipLswjs.snp.bottom).offset(8)
            make.bottom.equalToSuperview().offset(-27)
        }
    }
    
    func buildItemView(deols: [Vague]) {
        var tempsvw: ConsiekwItemView?
        
        deols.enumerated().forEach { (index, element) in
            let view = ConsiekwItemView(frame: CGRectZero, inputStyle: element.fainter == "pleaded" ? .RZ_Time : .RZ_Text)
            view.titlesljdlab.text = element.revolt
            view.tesjwtextFiedwView.text = element.delicacy
            view.inputDelesjuw = self
            if let _key = element.fainter {
                self.savepashw[_key] = element.revolt
                view.itenKey = _key
            }
            
            self.contenswwlView.addSubview(view)
            
            if let _tt = tempsvw {
                if index == deols.count - 1 {
                    view.snp.makeConstraints { make in
                        make.left.width.equalTo(_tt)
                        make.top.equalTo(_tt.snp.bottom).offset(8)
                        make.bottom.equalToSuperview().offset(-8)
                    }
                } else {
                    view.snp.makeConstraints { make in
                        make.left.width.equalTo(_tt)
                        make.top.equalTo(_tt.snp.bottom).offset(8)
                    }
                }
            } else {
                view.snp.makeConstraints { make in
                    make.left.width.top.equalToSuperview()
                }
            }
            
            tempsvw = view
        }
    }
}

extension CardAuthwPwekskPopView: InfoAuthCompelwProtocol {
    func toushInfoItem(itemView: UIView) {
        guard let _viskw = itemView as? ConsiekwItemView, _viskw.renzhenSylesk == .RZ_Time else {
            return
        }
        
        let picker: CardAuthwTimePiswView = CardAuthwTimePiswView(frame: UIScreen.main.bounds)
        UIDevice.current.keyWindow().addSubview(picker)
        UIView.transition(with: picker, duration: 0.3, options: UIView.AnimationOptions.transitionCrossDissolve) {
            picker.alpha = 1
        } completion: { _ in
            self.alpha = 0
        }
        
        picker.clickConfirmClosure = { [weak self] (pospwView: EsensiwlwsBadisnPresentView, sender: APPActivityButton) in
            guard let _pp = pospwView as? CardAuthwTimePiswView, let _date = _pp.selectedDate else {
                return
            }
            
            guard let _key = _viskw.itenKey else {
                return
            }
            
            self?.savepashw[_key] = _date
            _viskw.tesjwtextFiedwView.text = _date
            
            UIView.transition(with: picker, duration: 0.3, options: UIView.AnimationOptions.transitionCrossDissolve) {
                picker.alpha = .zero
            } completion: { _ in
                self?.alpha = 1
                picker.removeFromSuperview()
            }
        }
        
        picker.closeClosure = {[weak self] (ppsw: EsensiwlwsBadisnPresentView) in
            UIView.transition(with: picker, duration: 0.3, options: UIView.AnimationOptions.transitionCrossDissolve) {
                picker.alpha = .zero
            } completion: { _ in
                self?.alpha = 1
                picker.removeFromSuperview()
            }
        }
    }
    
    func didEndEditeing(itemsiw: UIView, inputsw: String?) {
        guard let _view = itemsiw as? ConsiekwItemView, let _key = _view.itenKey, let _tsw = inputsw else {
            return
        }
        
        self.savepashw[_key] = _tsw
    }
}
