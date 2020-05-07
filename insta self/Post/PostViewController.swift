//
//  PostViewController.swift
//  insta self
//
//  Created by ASW-研修３ on 2020/05/07.
//  Copyright © 2020 ASW-研修３. All rights reserved.
//

import UIKit
import PGFramework
// MARK: - Property
class PostViewController: BaseViewController {
    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var mainView: PostMainView!
}
// MARK: - Life cycle
extension PostViewController {
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
    }
}
// MARK: - Protocol
extension PostViewController: HeaderViewDelegate {
    func touchedLeftButton(_ sender: UIButton) {
        let homeViewController = HomeViewController()
        navigationController?.pushViewController(homeViewController, animated: true)
        animatorManager.navigationType = .slide_pop
    }
    func touchedRightButton(_ sender: UIButton) {
        let postModel: PostModel = PostModel()
        if let text = mainView.textField.text{
            postModel.description = text
        }
        PostModel.create(request: postModel){
            //成功したときの処理
            
        }
        let homeViewController = HomeViewController()
        navigationController?.pushViewController(homeViewController, animated: true)
        animatorManager.navigationType = .slide_push
    }
}
// MARK: - method
extension PostViewController {
    func setDelegate(){
        headerView.delegate = self
    }
    func setHeaderView(){
        headerView.setLeft(text: "キャンセル")
        headerView.setRight(text: "シェア")
    }
}


