//
//  RastwAnsRasyDaysView.swift
//  PintarDom
//
//  Created by Yu Chen  on 2025/11/18.
//

import UIKit

class RastwAnsRasyDaysView: UIView {

    private lazy var centerLine: UIView = {
        let view = UIView(frame: CGRectZero)
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var termLab: UILabel = {
        let view = UILabel(frame: CGRectZero)
        view.textAlignment = .center
        view.numberOfLines = 0
        return view
    }()
    
    private lazy var timeLab: UILabel = {
        let view = UILabel(frame: CGRectZero)
        view.textAlignment = .center
        view.numberOfLines = 0
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.corner(20)
        self.backgroundColor = UIColor.white.withAlphaComponent(0.43)
        
        self.addSubview(self.centerLine)
        self.addSubview(self.termLab)
        self.addSubview(self.timeLab)
        
        self.centerLine.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(CGSize(width: 1, height: 43))
            make.verticalEdges.equalToSuperview().inset(24)
        }
        
        self.termLab.snp.makeConstraints { make in
            make.centerY.equalTo(self.centerLine)
            make.right.equalTo(self.centerLine.snp.left).offset(-jk_kScreenW * 0.1)
        }
        
        self.timeLab.snp.makeConstraints { make in
            make.centerY.equalTo(self.centerLine)
            make.left.equalTo(self.centerLine.snp.right).offset(jk_kScreenW * 0.1)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setLoasTip(_ tip: String, value: String, isDay: Bool) {
        let parasm: NSMutableParagraphStyle = NSMutableParagraphStyle()
        parasm.paragraphSpacing = 4
        parasm.alignment = .center
        let atttSiwks: NSMutableAttributedString = NSMutableAttributedString(string: "\(tip)\n", attributes: [.font: UIFont.systemFont(ofSize: 12), .foregroundColor: UIColor.ppGray8C, .paragraphStyle: parasm])
        atttSiwks.append(NSMutableAttributedString(string: value, attributes: [.foregroundColor: UIColor.hexStringColor(hexString: "#0972A4")]))
        
        if isDay {
            self.timeLab.attributedText = atttSiwks
        } else {
            self.termLab.attributedText = atttSiwks
        }
    }
}
