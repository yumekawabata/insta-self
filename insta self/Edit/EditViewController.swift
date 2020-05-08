//
//  EditViewController.swift
//  insta self
//
//  Created by ASW-研修３ on 2020/05/07.
//  Copyright © 2020 ASW-研修３. All rights reserved.
//

import UIKit
import PGFramework
// MARK: - Property
class EditViewController: BaseViewController {
    @IBOutlet weak var mainView: EditMainView!
    @IBOutlet weak var headeView: HeaderView!
    
        var postModel: PostModel = PostModel()
}
// MARK: - Life cycle
extension EditViewController {
    override func loadView() {
        super.loadView()
        setDelegate()
        setHeaderView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        giveModel()
    }
}
// MARK: - Protocol
extension EditViewController: HeaderViewDelegate {
    func touchedRightButton(_ sender: UIButton) {
        if let text = mainView.textField.text{
            postModel.description = text}
        PostModel.update(request: postModel) {
            self.dismiss(animated: true, completion: nil)
        }
    }
    func touchedLeftButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}

extension EditViewController: EditMainViewDelegate {
    func touchedDeleteButton() {
        PostModel.delete(id: postModel.id) {
            self.dismiss(animated: true, completion: nil)
            }
        }
    }

// MARK: - method
extension EditViewController {
    func setDelegate(){
        mainView.delegate = self
        headeView.delegate = self
    }
    func setHeaderView(){
        headeView.setLeft(text: "キャンセル")
        headeView.setRight(text: "完了")
    }
    func giveModel(){
        mainView.updateView(postModel: postModel)
    }
}


