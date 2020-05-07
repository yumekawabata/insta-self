//
//  EditMainView.swift
//  insta self
//
//  Created by ASW-研修３ on 2020/05/07.
//  Copyright © 2020 ASW-研修３. All rights reserved.
//

import UIKit
import PGFramework
protocol EditMainViewDelegate: NSObjectProtocol{
}
extension EditMainViewDelegate {
}
// MARK: - Property
class EditMainView: BaseView {
    weak var delegate: EditMainViewDelegate? = nil
    
    @IBOutlet weak var textField: UITextField!

    @IBAction func touchedButton(_ sender: UIButton) {
    }
}
// MARK: - Life cycle
extension EditMainView {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Protocol
extension EditMainView {
}
// MARK: - method
extension EditMainView {
}

