//
//  DetailMainView.swift
//  insta self
//
//  Created by ASW-研修３ on 2020/05/07.
//  Copyright © 2020 ASW-研修３. All rights reserved.
//

import UIKit
import PGFramework
protocol DetailMainViewDelegate: NSObjectProtocol{
}
extension DetailMainViewDelegate {
}
// MARK: - Property
class DetailMainView: BaseView {
    weak var delegate: DetailMainViewDelegate? = nil
    @IBOutlet weak var label: UILabel!
}
// MARK: - Life cycle
extension DetailMainView {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Protocol
extension DetailMainView {
}
// MARK: - method
extension DetailMainView {
    func getModel(postModel: PostModel){
        label.text = postModel.description
        
    }
}

