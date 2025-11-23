//
//  InfoAuthItemSinglePickerView.swift
//  PintarDom
//
//  Created by Yu Chen  on 2025/11/23.
//

import UIKit
import BRPickerView

class InfoAuthItemSinglePickerView: EsensiwlwsBadisnPresentView {

    open var selcjesGosw: Uttered?
    open var closeClosure: ((EsensiwlwsBadisnPresentView) -> Void)?
    
    private lazy var gradiensView: GradientColorView = {
        let vew = GradientColorView()
        vew.buildGradientWithColors(gradientColors: [UIColor.hexStringColor(hexString: "#72FFE4", alpha: 0.2), UIColor.hexStringColor(hexString: "#3FE2FF", alpha: 0.2)], gradientStyle: GradientDirectionStyle.leftToRight)
        vew.corner(16)
        return vew
    }()
    
    private lazy var suwjeypickerView: BRTextPickerView = {
        let _pickView = BRTextPickerView(pickerMode: BRTextPickerMode.componentSingle)
        let style: BRPickerStyle = BRPickerStyle()
        style.hiddenDoneBtn = true
        style.hiddenCancelBtn = true
        style.hiddenTitleLine = true
        style.pickerColor = .clear
        style.pickerTextColor = UIColor.ppBlack33
        style.pickerTextFont = UIFont.loadSpecialFont(size: 14, ftStyle: FontStyle.Inter_Medium)
        style.selectRowTextColor = UIColor.ppBlack33
        style.selectRowTextFont = UIFont.loadSpecialFont(size: 14, ftStyle: FontStyle.Inter_Medium)
        style.pickerHeight = 250
        style.separatorColor = UIColor.clear
        _pickView.pickerStyle = style
        return _pickView
    }()
    
    private lazy var pickerContentView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: jk_kScreenW - 108, height: 305))
    
    override func buildPresentView() {
        super.buildPresentView()
        self.titleLab.text = APPLanguageInsTool.loadLanguage("auth_pop_select")
        
        self.contentView.addSubview(self.gradiensView)
        self.contentView.addSubview(self.pickerContentView)
        
        self.suwjeypickerView.singleChangeBlock = {[weak self] (models: BRTextModel?, indes: Int) in
            self?.selcjesGosw = Uttered()
            self?.selcjesGosw?.able = models?.text
            self?.selcjesGosw?.fainted = models?.code
        }
        
        self.suwjeypickerView.singleResultBlock = {[weak self] (models: BRTextModel?, indes: Int) in
            self?.selcjesGosw = Uttered()
            self?.selcjesGosw?.able = models?.text
            self?.selcjesGosw?.fainted = models?.code
        }
    }
    
    override func layoutPresentView() {
        super.layoutPresentView()
        
        self.pickerContentView.snp.makeConstraints { make in
            make.top.equalTo(self.titleLab.snp.bottom).offset(50)
            make.left.equalToSuperview().offset(12)
            make.size.equalTo(CGSize(width: jk_kScreenW - 108, height: 250))
        }
        
//        self.suwjeypickerView.snp.makeConstraints { make in
//            make.top.equalTo(self.titleLab.snp.bottom).offset(50)
//            make.left.equalToSuperview().offset(12)
//            make.right.equalToSuperview().offset(-25)
//            make.height.equalTo(250)
//        }
        
        self.gradiensView.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(self.suwjeypickerView)
            make.height.equalTo(40)
            make.centerY.equalTo(self.suwjeypickerView)
        }
        
        self.confirmBtn.snp.remakeConstraints { make in
            make.height.equalTo(50)
            make.centerX.equalTo(self.titleLab)
            make.top.equalTo(self.suwjeypickerView.snp.bottom).offset(12)
            make.bottom.equalToSuperview().offset(-27)
        }
    }
    
    override func confirmClick(sender: APPActivityButton) {
        self.suwjeypickerView.doneBlock?()
        super.confirmClick(sender: sender)
    }
    
    override func closePresentView() {
        super.closePresentView()
        self.closeClosure?(self)
    }
    
    func reloadSindlwPickerViews(moelsw: [Uttered]) {
        var slws_arskw: [[String: String]] = []
        
        moelsw.forEach { element in
            if let _ke = element.fainted, let _text = element.able {
                slws_arskw.append(["code": _ke, "text": _text])
            }
        }
        
        self.suwjeypickerView.dataSourceArr = NSArray.br_modelArray(withJson: slws_arskw, mapper: nil)
        self.suwjeypickerView.addPicker(to: self.pickerContentView)
    }
}
