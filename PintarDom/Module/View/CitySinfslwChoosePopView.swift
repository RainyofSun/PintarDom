//
//  CitySinfslwChoosePopView.swift
//  PintarDom
//
//  Created by 一刻 on 2025/11/24.
//

import UIKit

class CityCellswk: UITableViewCell {
    private lazy var gradiensView: GradientColorView = {
        let vew = GradientColorView()
        vew.buildGradientWithColors(gradientColors: [UIColor.hexStringColor(hexString: "#72FFE4", alpha: 0.2), UIColor.hexStringColor(hexString: "#3FE2FF", alpha: 0.2)], gradientStyle: GradientDirectionStyle.leftToRight)
        vew.corner(16)
        vew.isHidden = true
        return vew
    }()
    
    private(set) lazy var ciskwLab: UILabel = UILabel.normalTextLabel("", t_color: UIColor.ppBlack33, t_f: UIFont.loadSpecialFont(size: 14, ftStyle: FontStyle.Inter_SemiBold))
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.backgroundColor = .clear
        self.backgroundColor = .clear
        self.selectionStyle = .none
        
        self.contentView.addSubview(self.gradiensView)
        self.contentView.addSubview(self.ciskwLab)
        
        self.gradiensView.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview()
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-16)
        }
        
        self.ciskwLab.snp.makeConstraints { make in
            make.height.greaterThanOrEqualTo(40)
            make.verticalEdges.equalToSuperview()
            make.horizontalEdges.equalTo(self.gradiensView).inset(8)
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.gradiensView.isHidden = !selected
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class CitySinfslwChoosePopView: EsensiwlwsBadisnPresentView {

    private lazy var dayLabs: UILabel = UILabel.normalTextLabel(APPLanguageInsTool.loadLanguage("auth_pop_choose"), t_color: UIColor.hexStringColor(hexString: "#0972A4"), t_f: UIFont.loadSpecialFont(size: 16, ftStyle: FontStyle.Inter_SemiBold))
    private lazy var monthLabs: UILabel = UILabel.normalTextLabel(APPLanguageInsTool.loadLanguage("auth_pop_choose"), t_color: UIColor.ppBlack33, t_f: UIFont.loadSpecialFont(size: 16, ftStyle: FontStyle.Inter_SemiBold))
    private lazy var yearLabs: UILabel = UILabel.normalTextLabel(APPLanguageInsTool.loadLanguage("auth_pop_choose"), t_color: UIColor.ppBlack33, t_f: UIFont.loadSpecialFont(size: 16, ftStyle: FontStyle.Inter_SemiBold))
    private lazy var dasLineView: UIView = UIView(frame: CGRect(origin: CGPointZero, size: CGSize(width: jk_kScreenW - 120, height: 1)))
    
    private lazy var pickerContentView: UIScrollView = {
        let view = UIScrollView(frame: CGRect(x: 0, y: 0, width: jk_kScreenW - 108, height: 305))
        view.contentSize = CGSize(width: (jk_kScreenW - 120) * 3, height: 0)
        view.isPagingEnabled = true
        view.isScrollEnabled = false
        return view
    }()
    
    private lazy var cityTableView1: UITableView = {
        let view = UITableView(frame: CGRectZero, style: UITableView.Style.plain)
        view.separatorStyle = .none
        view.backgroundColor = .clear
        return view
    }()
    
    private lazy var cityTableView2: UITableView = {
        let view = UITableView(frame: CGRectZero, style: UITableView.Style.plain)
        view.separatorStyle = .none
        view.backgroundColor = .clear
        return view
    }()
    
    private lazy var cityTableView3: UITableView = {
        let view = UITableView(frame: CGRectZero, style: UITableView.Style.plain)
        view.separatorStyle = .none
        view.backgroundColor = .clear
        return view
    }()
    
    private(set) var selectedDate: String = ""
    private var has_select_all: Bool = false
    
    private var cityArray1: [InsjwjdCityCalswjCacheModel] = []
    private var cityArray2: [InsjwjdCityCalswjCacheModel] = []
    private var cityArray3: [InsjwjdCityCalswjCacheModel] = []
    
    private var selectedIndexPath2: IndexPath?
    private var selectedIndexPath3: IndexPath?
    
    override func buildPresentView() {
        super.buildPresentView()
        self.titleLab.text = APPLanguageInsTool.loadLanguage("auth_pop_select")
        
        self.dayLabs.jk.addGestureTap {[weak self] _ in
            self?.pickerContentView.setContentOffset(CGPoint.zero, animated: true)
        }
        
        self.monthLabs.jk.addGestureTap {[weak self] _ in
            self?.pickerContentView.setContentOffset(CGPoint(x: jk_kScreenW - 120, y: .zero), animated: true)
        }
        
        self.yearLabs.jk.addGestureTap {[weak self] _ in
            self?.pickerContentView.setContentOffset(CGPoint(x: (jk_kScreenW - 120) * 2, y: .zero), animated: true)
        }
        
        self.dasLineView.jk.drawDashLine(strokeColor: UIColor.hexStringColor(hexString: "#999999", alpha: 0.3), lineLength: 6, lineSpacing: 2,)
        
        self.cityTableView1.register(CityCellswk.self, forCellReuseIdentifier: CityCellswk.className())
        self.cityTableView2.register(CityCellswk.self, forCellReuseIdentifier: CityCellswk.className())
        self.cityTableView3.register(CityCellswk.self, forCellReuseIdentifier: CityCellswk.className())
        
        self.cityTableView1.delegate = self
        self.cityTableView1.dataSource = self
        self.cityTableView2.delegate = self
        self.cityTableView2.dataSource = self
        self.cityTableView3.delegate = self
        self.cityTableView3.dataSource = self
        
        self.contentView.addSubview(self.dayLabs)
        self.contentView.addSubview(self.monthLabs)
        self.contentView.addSubview(self.yearLabs)
        self.contentView.addSubview(self.dasLineView)
        self.contentView.addSubview(self.pickerContentView)
        self.pickerContentView.addSubview(self.cityTableView1)
        self.pickerContentView.addSubview(self.cityTableView2)
        self.pickerContentView.addSubview(self.cityTableView3)
        
        if FileManager.default.fileExists(atPath: GLoskwCommenskwmodls.shared.ciprosjdkCityPath) {
            let modelsw = InsjwjdCityCalswjCacheModel.readCosiDataFormsDisk()
            if !modelsw.isEmpty {
                self.cityArray1.append(contentsOf: modelsw)
                self.cityTableView1.reloadData()
            }
        }
    }
    
    override func layoutPresentView() {
        super.layoutPresentView()
        
        self.dayLabs.snp.makeConstraints { make in
            make.top.equalTo(self.titleLab.snp.bottom).offset(30)
            make.horizontalEdges.equalTo(self.pickerContentView)
        }
        
        self.monthLabs.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(self.dayLabs)
            make.top.equalTo(self.dayLabs.snp.bottom).offset(16)
        }
        
        self.yearLabs.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(self.monthLabs)
            make.top.equalTo(self.monthLabs.snp.bottom).offset(16)
        }
        
        self.dasLineView.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(self.pickerContentView)
            make.top.equalTo(self.yearLabs.snp.bottom).offset(16)
            make.height.equalTo(1)
        }
        
        self.pickerContentView.snp.makeConstraints { make in
            make.top.equalTo(self.dasLineView.snp.bottom)
            make.left.equalToSuperview()
            make.right.equalToSuperview().offset(-12)
            make.size.equalTo(CGSize(width: jk_kScreenW - 120, height: 305))
        }
        
        self.cityTableView1.snp.makeConstraints { make in
            make.left.top.size.equalToSuperview()
        }
        
        self.cityTableView2.snp.makeConstraints { make in
            make.left.equalTo(self.cityTableView1.snp.right)
            make.top.size.equalTo(self.cityTableView1)
        }
        
        self.cityTableView3.snp.makeConstraints { make in
            make.left.equalTo(self.cityTableView2.snp.right)
            make.top.size.equalTo(self.cityTableView2)
        }
        
        self.confirmBtn.snp.remakeConstraints { make in
            make.height.equalTo(50)
            make.centerX.equalTo(self.titleLab)
            make.top.equalTo(self.pickerContentView.snp.bottom).offset(12)
            make.bottom.equalToSuperview().offset(-27)
        }
    }
    
    override func confirmClick(sender: APPActivityButton) {
        guard self.has_select_all else {
            self.makeToast(APPLanguageInsTool.loadLanguage("address_tip"))
            return
        }
        super.confirmClick(sender: sender)
    }
}

extension CitySinfslwChoosePopView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.cityTableView1 {
            return self.cityArray1.count
        } else if tableView == self.cityTableView2 {
            return self.cityArray2.count
        } else {
            return self.cityArray3.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let _cell = tableView.dequeueReusableCell(withIdentifier: CityCellswk.className(), for: indexPath) as? CityCellswk else {
            return UITableViewCell()
        }
        
        if tableView == self.cityTableView1 {
            _cell.ciskwLab.text = self.cityArray1[indexPath.row].able
        } else if tableView == self.cityTableView2 {
            _cell.ciskwLab.text = self.cityArray2[indexPath.row].able
        } else {
            _cell.ciskwLab.text = self.cityArray3[indexPath.row].able
        }
        
        return _cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let _cell = tableView.cellForRow(at: indexPath) as? CityCellswk {
            _cell.setSelected(true, animated: true)
        }
        
        if tableView == self.cityTableView1 {
            self.dayLabs.text = self.cityArray1[indexPath.row].able
            self.dayLabs.textColor = UIColor.hexStringColor(hexString: "#0972A4")
            self.monthLabs.text = APPLanguageInsTool.loadLanguage("auth_pop_choose")
            self.monthLabs.textColor = UIColor.ppBlack33
            self.yearLabs.text = APPLanguageInsTool.loadLanguage("auth_pop_choose")
            self.yearLabs.textColor = UIColor.ppBlack33
            
            if let _cityw = self.cityArray1[indexPath.row].fast {
                self.cityArray2.removeAll()
                self.cityArray2.append(contentsOf: _cityw)
                self.cityTableView2.reloadData()
            }
            
            if let _c_idex = self.selectedIndexPath2, let _cell = self.cityTableView2.cellForRow(at: _c_idex) {
                _cell.setSelected(false, animated: true)
            }
            
            if let _c_idex = self.selectedIndexPath3, let _cell = self.cityTableView3.cellForRow(at: _c_idex) {
                _cell.setSelected(false, animated: true)
            }
            
            self.has_select_all = false
            self.selectedDate = self.dayLabs.text ?? ""
            
            self.pickerContentView.setContentOffset(CGPoint(x: jk_kScreenW - 120, y: .zero), animated: true)
        }
        
        if tableView == self.cityTableView2 {
            self.selectedIndexPath2 = indexPath
            self.monthLabs.text = self.cityArray2[indexPath.row].able
            self.monthLabs.textColor = UIColor.hexStringColor(hexString: "#0972A4")
            self.yearLabs.text = APPLanguageInsTool.loadLanguage("auth_pop_choose")
            self.yearLabs.textColor = UIColor.ppBlack33
            
            if let _cityw = self.cityArray2[indexPath.row].fast {
                self.cityArray3.removeAll()
                self.cityArray3.append(contentsOf: _cityw)
                self.cityTableView3.reloadData()
            }
            
            if let _c_idex = self.selectedIndexPath3, let _cell = self.cityTableView3.cellForRow(at: _c_idex) {
                _cell.setSelected(false, animated: true)
            }
            
            self.has_select_all = false
            self.selectedDate += (" | " + (self.monthLabs.text ?? ""))
            
            self.pickerContentView.setContentOffset(CGPoint(x: (jk_kScreenW - 120) * 2, y: .zero), animated: true)
        }
        
        if tableView == self.cityTableView3 {
            self.selectedIndexPath3 = indexPath
            self.yearLabs.text = self.cityArray3[indexPath.row].able
            self.yearLabs.textColor = UIColor.hexStringColor(hexString: "#0972A4")
            
            self.has_select_all = true
            self.selectedDate += (" | " + (self.monthLabs.text ?? ""))
        }
    }
}
