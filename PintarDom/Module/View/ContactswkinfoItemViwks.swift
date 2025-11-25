//
//  ContactswkinfoItemViwks.swift
//  PintarDom
//
//  Created by Yu Chen  on 2025/11/23.
//

import UIKit

class ContactswkinfoItemViwks: UIView {

    weak open var inputDelesjuw: InfoAuthCompelwProtocol?
    open var itenChose: (cacheKey: String, chosse: [Uttered])?
    private(set) var isReleation: Bool = true
    
    private(set) lazy var titlesljdlab: UILabel = UILabel.normalTextLabel("", t_color: UIColor.ppBlack33, t_f: UIFont.loadSpecialFont(size: 16, ftStyle: FontStyle.Inter_Medium))
    
    private lazy var bgViewsk: UIView = {
        let view = UIView(frame: CGRectZero)
        view.backgroundColor = UIColor.hexStringColor(hexString: "#EBF9FF")
        view.corner(16)
        return view
    }()
    
    private(set) lazy var secondTitlesljdlab: UILabel = UILabel.normalTextLabel("", t_color: UIColor.ppBlack33, t_f: UIFont.loadSpecialFont(size: 16, ftStyle: FontStyle.Inter_Medium))
    
    private(set) lazy var arrownsImswh: UIImageView = UIImageView(image: UIImage(named: "setting_more"))
    private(set) lazy var tesjwtextFiedwView: ForbidActionTextFiled = {
        let view = ForbidActionTextFiled(frame: CGRectZero)
        view.borderStyle = .none
        view.textColor = UIColor.ppBlack33
        view.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.medium)
        return view
    }()
    
    private lazy var secondbgViewsk: UIView = {
        let view = UIView(frame: CGRectZero)
        view.backgroundColor = UIColor.hexStringColor(hexString: "#EBF9FF")
        view.corner(16)
        return view
    }()
    
    private(set) lazy var thirdTitlesljdlab: UILabel = UILabel.normalTextLabel("", t_color: UIColor.ppBlack33, t_f: UIFont.loadSpecialFont(size: 16, ftStyle: FontStyle.Inter_Medium))
    
    private(set) lazy var arrownsImswh1: UIImageView = UIImageView(image: UIImage(named: "setting_more"))
    private(set) lazy var tesjwtextFiedwView1: ForbidActionTextFiled = {
        let view = ForbidActionTextFiled(frame: CGRectZero)
        view.borderStyle = .none
        view.textColor = UIColor.ppBlack33
        view.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.medium)
        return view
    }()
    
    private(set) var renzhenSylesk: RenZhengElemeent = RenZhengElemeent.RZ_Text
    
    init(frame: CGRect, inputStyle: RenZhengElemeent) {
        super.init(frame: frame)
        
        self.secondTitlesljdlab.textAlignment = .left
        self.thirdTitlesljdlab.textAlignment = .left
        
        self.renzhenSylesk = inputStyle
        self.arrownsImswh.isHidden = inputStyle == .RZ_Text
        self.addSubview(self.titlesljdlab)
        self.addSubview(self.bgViewsk)
        self.bgViewsk.addSubview(self.secondTitlesljdlab)
        self.bgViewsk.addSubview(self.tesjwtextFiedwView)
        self.bgViewsk.addSubview(self.arrownsImswh)
        self.addSubview(self.secondbgViewsk)
        self.secondbgViewsk.addSubview(self.thirdTitlesljdlab)
        self.secondbgViewsk.addSubview(self.tesjwtextFiedwView1)
        self.secondbgViewsk.addSubview(self.arrownsImswh1)
        
        self.tesjwtextFiedwView.delegate = self
        self.tesjwtextFiedwView1.delegate = self
        
        self.titlesljdlab.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.top.equalToSuperview()
        }
        
        self.bgViewsk.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.equalTo(self.titlesljdlab.snp.bottom).offset(10)
        }
        
        self.secondTitlesljdlab.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16)
            make.top.equalToSuperview().offset(14)
        }
        
        self.tesjwtextFiedwView.snp.makeConstraints { make in
            make.top.equalTo(self.secondTitlesljdlab.snp.bottom).offset(8)
            make.left.equalTo(self.secondTitlesljdlab)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(46)
            make.bottom.equalToSuperview()
        }
        
        self.arrownsImswh.snp.makeConstraints { make in
            make.centerY.equalTo(self.tesjwtextFiedwView)
            make.right.equalToSuperview().offset(-16)
        }
        
        self.secondbgViewsk.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(self.bgViewsk)
            make.top.equalTo(self.bgViewsk.snp.bottom).offset(12)
            make.bottom.equalToSuperview()
        }
        
        self.thirdTitlesljdlab.snp.makeConstraints { make in
            make.left.equalTo(self.secondTitlesljdlab)
            make.top.equalToSuperview().offset(14)
        }
        
        self.tesjwtextFiedwView1.snp.makeConstraints { make in
            make.horizontalEdges.height.equalTo(self.tesjwtextFiedwView)
            make.top.equalTo(self.thirdTitlesljdlab.snp.bottom).offset(8)
            make.bottom.equalToSuperview()
        }
        
        self.arrownsImswh1.snp.makeConstraints { make in
            make.centerX.equalTo(self.arrownsImswh)
            make.centerY.equalTo(self.tesjwtextFiedwView1)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func reloadContactsItemModel(itemModel: Obvious) {
        if let _oswk = itemModel.uttered {
            self.itenChose = ("", _oswk)
        }
        
        self.titlesljdlab.text = itemModel.teach
        self.secondTitlesljdlab.text = itemModel.forbore
        self.thirdTitlesljdlab.text = itemModel.malice
        
        if let _res_place = itemModel.depended {
            self.tesjwtextFiedwView.attributedPlaceholder = NSAttributedString(string: _res_place, attributes: [.font: UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.medium), .foregroundColor: UIColor.ppBlack33.withAlphaComponent(0.6)])
        }
        
        if let _phone_place = itemModel.arose {
            self.tesjwtextFiedwView1.attributedPlaceholder = NSAttributedString(string: _phone_place, attributes: [.font: UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.medium), .foregroundColor: UIColor.ppBlack33.withAlphaComponent(0.6)])
        }
        
        if let _res = itemModel.farther, let _chose = self.itenChose?.chosse {
            for element in _chose {
                if element.fainted == _res {
                    self.tesjwtextFiedwView.text = element.able
                    break
                }
            }
        }
        
        if let _phow = itemModel.able, let _pho = itemModel.press {
            self.tesjwtextFiedwView1.text = "\(_phow)-\(_pho)"
        }
    }
    
    func reloadRelationship(shaip: String? = nil, phone: String? = nil) {
        if shaip != nil {
            self.tesjwtextFiedwView.text = shaip
        }
        
        if phone != nil {
            self.tesjwtextFiedwView1.text = phone
        }
    }
}

extension ContactswkinfoItemViwks: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        self.isReleation = textField == self.tesjwtextFiedwView
        self.inputDelesjuw?.toushInfoItem(itemView: self)
        return self.renzhenSylesk == .RZ_Text
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.isReleation = textField == self.tesjwtextFiedwView
        self.inputDelesjuw?.didEndEditeing(itemsiw: self, inputsw: textField.text)
    }
}
