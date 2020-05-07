//
//  HomeMainTableViewCell.swift
//  insta self
//
//  Created by ASW-研修３ on 2020/05/07.
//  Copyright © 2020 ASW-研修３. All rights reserved.
//

import UIKit
import PGFramework
protocol HomeMainTableViewCellDelegate: NSObjectProtocol{
}
extension HomeMainTableViewCellDelegate {
}
// MARK: - Property
class HomeMainTableViewCell: BaseTableViewCell {
    weak var delegate: HomeMainTableViewCellDelegate? = nil
    @IBOutlet weak var descriptionLabel: UILabel!
}
// MARK: - Life cycle
extension HomeMainTableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Protocol
extension HomeMainTableViewCell {
}
// MARK: - method
extension HomeMainTableViewCell {
    func updateCell(postModel: PostModel){
        descriptionLabel.text = postModel.description
    }
}

