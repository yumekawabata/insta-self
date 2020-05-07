//
//  DetailViewController.swift
//  insta self
//
//  Created by ASW-研修３ on 2020/05/07.
//  Copyright © 2020 ASW-研修３. All rights reserved.
//

import UIKit
import PGFramework
// MARK: - Property
class DetailViewController: BaseViewController {
    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var mainView: DetailMainView!
    
    var postModel: PostModel = PostModel()
}
// MARK: - Life cycle
extension DetailViewController {
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
extension DetailViewController: HeaderViewDelegate {
    func touchedLeftButton(_ sender: UIButton) {
        let homeViewContoroller = HomeViewController()
        navigationController?.pushViewController(homeViewContoroller, animated: true)
        animatorManager.navigationType = .slide_pop
    }
    func touchedRightButton(_ sender: UIButton) {
        let editViewController = EditViewController()
        editViewController.postModel = postModel
        editViewController.modalPresentationStyle = .fullScreen
        present(editViewController, animated: true, completion: nil)
    }
}
// MARK: - method
extension DetailViewController {
    func setDelegate(){
        headerView.delegate = self
    }
    func setHeaderView(){
        headerView.setRight(text: "Edit")
        headerView.setLeft(text: "キャンセル")
    }
    func giveModel(){
        mainView.getModel(postModel: postModel)
    }

}


