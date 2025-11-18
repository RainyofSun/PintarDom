//
//  ComskwkProslwViewController.swift
//  PintarDom
//
//  Created by Yu Chen  on 2025/11/18.
//

import UIKit

class ComskwkProslwViewController: EsensiilsadwsiwViewController {

    private lazy var listVTabslw: UITableView = {
        let view = UITableView(frame: CGRectZero, style: UITableView.Style.plain)
        view.backgroundColor = .clear
        view.separatorStyle = .none
        return view
    }()
    
    private var sources: [[String: String]] = [
        ["title": APPLanguageInsTool.loadLanguage("problems_title1"), "content": APPLanguageInsTool.loadLanguage("problems_content1")],
        ["title": APPLanguageInsTool.loadLanguage("problems_title2"), "content": APPLanguageInsTool.loadLanguage("problems_content2")],
        ["title": APPLanguageInsTool.loadLanguage("problems_title3"), "content": APPLanguageInsTool.loadLanguage("problems_content3")],
        ["title": APPLanguageInsTool.loadLanguage("problems_title4"), "content": APPLanguageInsTool.loadLanguage("problems_content4")],
        ["title": APPLanguageInsTool.loadLanguage("problems_title5"), "content": APPLanguageInsTool.loadLanguage("problems_content5")],
    ]
    override func buildPageUI() {
        super.buildPageUI()
        self.basicScrollContentView.isHidden = true
        self.gradientView.isHidden = false
        self.gradientView.buildGradientWithColors(gradientColors: [UIColor.hexStringColor(hexString: "#58F8FF"), UIColor.init(white: 1, alpha: 0)], gradientStyle: GradientDirectionStyle.topToBottom)
        self.title = APPLanguageInsTool.loadLanguage("problems_nav")
        
        self.listVTabslw.delegate = self
        self.listVTabslw.dataSource = self
        self.listVTabslw.register(ComskwkWuqjskwCelsTableViewCell.self, forCellReuseIdentifier: ComskwkWuqjskwCelsTableViewCell.className())
        
        self.view.addSubview(self.listVTabslw)
    }
    
    override func layoutPageViews() {
        super.layoutPageViews()
        self.listVTabslw.snp.makeConstraints { make in
            make.horizontalEdges.bottom.equalToSuperview()
            make.top.equalToSuperview().offset(jk_kNavFrameH + 16)
        }
    }
}

extension ComskwkProslwViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sources.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let _cell = tableView.dequeueReusableCell(withIdentifier: ComskwkWuqjskwCelsTableViewCell.className(), for: indexPath) as? ComskwkWuqjskwCelsTableViewCell else { return UITableViewCell() }
        
        _cell.titleLa.text = self.sources[indexPath.row]["title"]
        _cell.cosnrwmsLab.text = self.sources[indexPath.row]["content"]
        
        return _cell
    }
}
