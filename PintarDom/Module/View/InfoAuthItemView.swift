//
//  InfoAuthItemView.swift
//  PintarDom
//
//  Created by Yu Chen  on 2025/11/23.
//

import UIKit

class InfoAuthItemView: UIView {

    weak open var inputDelesjuw: InfoAuthCompelwProtocol?
    open var itenChose: (cacheKey: String, chosse: [Uttered])?
    
    private(set) lazy var titlesljdlab: UILabel = UILabel.normalTextLabel("", t_color: UIColor.ppBlack33, t_f: UIFont.loadSpecialFont(size: 16, ftStyle: FontStyle.Inter_Medium))
    
    private lazy var bgViewsk: UIView = {
        let view = UIView(frame: CGRectZero)
        view.backgroundColor = UIColor.hexStringColor(hexString: "#EBF9FF")
        view.corner(16)
        return view
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
        self.addSubview(self.titlesljdlab)
        self.addSubview(self.bgViewsk)
        self.bgViewsk.addSubview(self.tesjwtextFiedwView)
        self.bgViewsk.addSubview(self.arrownsImswh)
        
        self.tesjwtextFiedwView.delegate = self
        
        self.titlesljdlab.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.top.equalToSuperview()
        }
        
        self.bgViewsk.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(54)
            make.top.equalTo(self.titlesljdlab.snp.bottom).offset(10)
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

extension InfoAuthItemView: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        self.inputDelesjuw?.toushInfoItem(itemView: self)
        return self.renzhenSylesk == .RZ_Text
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.inputDelesjuw?.didEndEditeing(itemsiw: self, inputsw: textField.text)
    }
}
