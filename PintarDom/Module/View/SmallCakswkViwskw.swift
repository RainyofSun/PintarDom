//
//  SmallCakswkViwskw.swift
//  PintarDom
//
//  Created by Yu Chen  on 2025/11/21.
//

import UIKit

protocol SmalwlsCardPowksProtocol: AnyObject {
    func didSlskwkProdyctItem(sender: APPActivityButton, chanpinId: String)
}

class SmallCakswkViwskw: UIView {

    weak open var smlaDelegate: SmalwlsCardPowksProtocol?
    
    private lazy var tableView: UITableView = {
        let view = UITableView(frame: CGRectZero, style: UITableView.Style.plain)
        view.separatorStyle = .none
        view.backgroundColor = .clear
        return view
    }()
    
    private var _source: [UnaffectedListItem] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.register(SmalslwkCarsswTableViewCell.self, forCellReuseIdentifier: SmalslwkCarsswTableViewCell.className())
        
        self.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func reloadSamlwslSource(sourve: [UnaffectedListItem]) {
        self._source.removeAll()
        self._source.append(contentsOf: sourve)
        self.tableView.reloadData()
    }

}

extension SmallCakswkViwskw: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self._source.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let _cell = tableView.dequeueReusableCell(withIdentifier: SmalslwkCarsswTableViewCell.className(), for: indexPath) as? SmalslwkCarsswTableViewCell else {
            return UITableViewCell()
        }
        
        _cell.reloadCwlswkItesModel(model: self._source[indexPath.row])
        return _cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let _cell = tableView.cellForRow(at: indexPath) as? SmalslwkCarsswTableViewCell, let _diskw = self._source[indexPath.row].bosom else {
            return
        }
        
        self.smlaDelegate?.didSlskwkProdyctItem(sender: _cell.checksBtn, chanpinId: _diskw)
    }
}
