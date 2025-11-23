//
//  OrdekswOrksjwPskViewController.swift
//  PintarDom
//
//  Created by 一刻 on 2025/11/13.
//

import UIKit
import EmptyDataSet_Swift

class OrdekswOrksjwPskViewController: EsensiilsadwsiwViewController {

    private lazy var sliderView: OrderSlwbarViews = OrderSlwbarViews(frame: CGRectZero)
    private lazy var tableView: UITableView = {
        let view = UITableView(frame: CGRectZero, style: UITableView.Style.plain)
        view.separatorStyle = .none
        view.backgroundColor = .clear
        return view
    }()
    
    private var _orjdws_Sours: [OrderItem] = []
    private var type: Int = 7
    
    override func buildPageUI() {
        super.buildPageUI()
        self.title = APPLanguageInsTool.loadLanguage("order_nav")
        self.gradientView.isHidden = false
        self.gradientView.buildGradientWithColors(gradientColors: [UIColor.hexStringColor(hexString: "#21F0E8"), UIColor.hexStringColor(hexString: "#3BF8FF", alpha: 0.63)], gradientStyle: GradientDirectionStyle.leftTopToRightBottom)
        self.basicScrollContentView.isHidden = true
        
        self.sliderView.slideDelegate = self
        
        self.tableView.register(OrderskwksCelswkTableViewCell.self, forCellReuseIdentifier: OrderskwksCelswkTableViewCell.className())
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.emptyDataSetDelegate = self
        self.tableView.emptyDataSetSource = self
        
        self.view.addSubview(self.sliderView)
        self.view.addSubview(self.tableView)
        
        self.tableView.addMJRefresh {[weak self] _ in
            self?.pageNetRequest()
        }
        
        self.tableView.refresh(begin: true)
    }
    
    override func layoutPageViews() {
        super.layoutPageViews()
        
        self.sliderView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(jk_kNavFrameH)
            make.horizontalEdges.equalToSuperview().inset(16)
        }
        
        self.tableView.snp.makeConstraints { make in
            make.top.equalTo(self.sliderView.snp.bottom).offset(12)
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalToSuperview().offset(-jk_kTabbarFrameH - 10)
        }
    }
    
    override func pageNetRequest() {
        super.pageNetRequest()
        APPNetRequestManager.afnReqeustType(NetworkRequestConfig.defaultRequestConfig("qscgy/question", requestParams: ["frequently": "\(self.type)"])) {[weak self] (task: URLSessionDataTask, res: APPSuccessResponse) in
            self?.tableView.refresh(begin: false)
            guard let _jskw = res.jsonDict, let _skwl = OrdeswlListModwks.model(with: _jskw), let _chanskw = _skwl.slowly else {
                return
            }
            
            self?._orjdws_Sours.removeAll()
            self?._orjdws_Sours.append(contentsOf: _chanskw)
            self?.tableView.reloadEmptyDataSet()
        } failure: {[weak self] _, _ in
            self?.tableView.refresh(begin: false)
        }
    }
}

extension OrdekswOrksjwPskViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self._orjdws_Sours.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let _cell = tableView.dequeueReusableCell(withIdentifier: OrderskwksCelswkTableViewCell.className(), for: indexPath) as? OrderskwksCelswkTableViewCell else {
            return UITableViewCell()
        }
        
        _cell.reloadCOwskCelslwModel(model: self._orjdws_Sours[indexPath.row])
        
        return _cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let _url = self._orjdws_Sours[indexPath.row].positive {
            LuyouswkMakswTool.luYou.tiaoZhuanPage(luyouUrl: _url, needBackRoot: true)
        }
    }
}

extension OrdekswOrksjwPskViewController: EmptyDataSetDelegate, EmptyDataSetSource {
    func customView(forEmptyDataSet scrollView: UIScrollView) -> UIView? {
        let emptyView: OrdkekEmprytVies = OrdkekEmprytVies(frame: scrollView.bounds)
        emptyView.clickCoswaswClosure = {[weak self] in
            self?.tabBarController?.selectedIndex = 0
        }
        return emptyView
    }
}

extension OrdekswOrksjwPskViewController: ordekSeldekrProtocol {
    func didSelskwkItes(index: Int) {
        self.type = index
        self.tableView.refresh(begin: true)
    }
}
