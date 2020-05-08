//
//  PostModel.swift
//  insta self
//
//  Created by ASW-研修３ on 2020/05/07.
//  Copyright © 2020 ASW-研修３. All rights reserved.
//

import UIKit
import PGFramework
import FirebaseDatabase

class PostModel{
    var description: String = String()
    var id: String = String()
    fileprivate static let PATH: String = "Post"
}

extension PostModel{
    static func parse(data: [String: Any]) -> PostModel {
        let model = PostModel()
        if let description = data["description"] as? String{model.description = description}
        if let id = data ["id"]as? String {
            model.id = id
        }
        return model
    }
    static func setParameter(request: PostModel) -> [String:Any]{
    var parameter: [String: Any] = [:]
        parameter["description"] = request.description
        parameter["id"] = request.id
        return parameter
    }
}


//-C
extension PostModel{
    static func create(request: PostModel,success: @escaping() -> Void){
        let dbRef = Database.database().reference().child(PATH).childByAutoId()
        if let key = dbRef.key{
            request.id = key
        }
        let parameter = setParameter(request: request)
        dbRef.setValue(parameter)

        success()
    }
}


extension PostModel{
    static func reads(success:@escaping ([PostModel]) -> Void) {
        let dbRef = Database.database().reference().child(PATH)
        dbRef.observe(.value, with: { snapshot in
            var models: [PostModel] = [PostModel]()
            for item in (snapshot.children) {
                let snapshot = item as! DataSnapshot
                let data = snapshot.value as! [String: Any]
                let model: PostModel = parse(data: data)
                model.id = snapshot.key
                models.append(model)
            }
            success(models)
        })
    }
    static func readAt(id: String,success:@escaping (PostModel) -> Void,failure: @escaping() -> Void){
        let dbRef = Database.database().reference().child(PATH).child(id)
        dbRef.observe(.value) { (snapshot) in
            guard let data = snapshot.value as? [String: Any] else {
                failure()
                return}
            let model: PostModel = parse(data: data)
            success(model)
        }
        
    }

}

//-U
extension PostModel{
    static func update(request: PostModel,success: @escaping() -> Void){
        let id = request.id
        let dbRef = Database.database().reference().child(PATH).child(id)
        let parameter = setParameter(request: request)
        dbRef.updateChildValues(parameter) { (error, dbRef) in
            if error != nil {
                print("updateエラー",error)
            } else {
              success()
            }
        }
    }
}


//-D
extension PostModel{
    static func delete(id: String,success:@escaping() -> Void){
        let dbRef = Database.database().reference().child(PATH).child(id)
        dbRef.removeValue { (error, dbRef) in
            if error != nil {
                print("Deleteエラー",error)
            }else{
                success()
            }
        }
    }
    
}
