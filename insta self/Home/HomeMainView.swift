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
    }
}
// MARK: - Protocol
extension HomeMainView {
}
// MARK: - method
extension HomeMainView {
}

