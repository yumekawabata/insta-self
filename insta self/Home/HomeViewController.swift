//
//  HomeViewController.swift
//  insta self
//
//  Created by ASW-研修３ on 2020/05/07.
//  Copyright © 2020 ASW-研修３. All rights reserved.
//

import UIKit
import PGFramework
// MARK: - Property
class HomeViewController: BaseViewController {
    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var mainView: HomeMainView!
    
    var postModels: [PostModel] = [PostModel]()
}
// MARK: - Life cycle
extension HomeViewController {
    override func loadView() {
        super.loadView()
        setHeaderView()
        setDelegate()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getModel()
    }
}
// MARK: - Protocol
extension HomeViewController: HomeMainViewDelegate {
    func didSelectRowAt(indexPath: IndexPath) {
              let detailViewController = DetailViewController ()
        detailViewController.postModel = postModels[indexPath.row]
              navigationController?.pushViewController(detailViewController, animated: true)
          animatorManager.navigationType = .slide_push
    }
 
}
extension HomeViewController:HeaderViewDelegate {
    func touchedRightButton(_ sender: UIButton) {
        let postViewController = PostViewController()
        navigationController?.pushViewController(postViewController, animated: true)
        animatorManager.navigationType = .slide_push
    }
}
// MARK: - method
extension HomeViewController {
    func setDelegate(){
        headerView.delegate = self
        mainView.delegate = self
    }
    func setHeaderView(){
        headerView.setRight(text: "投稿")
    }
    func getModel(){
        PostModel.reads { (postModels) in
            self.mainView.getModel(postModels: postModels)
            self.postModels = postModels
//            for postModel in postModels {
//                print("DESC: ",postModel.description)
//            }
        }
        
    }
}


