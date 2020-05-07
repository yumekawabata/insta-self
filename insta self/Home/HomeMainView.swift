//
//  HomeMainView.swift
//  insta self
//
//  Created by ASW-研修３ on 2020/05/07.
//  Copyright © 2020 ASW-研修３. All rights reserved.
//

import UIKit
import PGFramework
protocol HomeMainViewDelegate: NSObjectProtocol{
}
extension HomeMainViewDelegate {
}
// MARK: - Property
class HomeMainView: BaseView {
    weak var delegate: HomeMainViewDelegate? = nil
    @IBOutlet weak var tableView: UITableView!
}
// MARK: - Life cycle
extension HomeMainView {
    override func awakeFromNib() {
        super.awakeFromNib()
        setDelegate()
        
        loadTableViewCellFromXib(tableView: tableView, cellName: "HomeMainTableViewCell")
    }
}
// MARK: - Protocol
extension HomeMainView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeMainTableViewCell", for: indexPath)as? HomeMainTableViewCell else {
            return UITableViewCell() }
        return cell
    }
    
}
// MARK: - method
extension HomeMainView {
    func setDelegate(){
        tableView.dataSource = self
    }
}

