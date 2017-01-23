//
//  LoginViewModel.swift
//  TaskMeNot
//
//  Created by Malinka S on 1/22/17.
//  Copyright © 2017 Rohit Nisal. All rights reserved.
//

import UIKit
import Firebase

enum Response<T> {
    case success(T)
    case error(T)
}

class LoginViewModel: NSObject {
    
    lazy var userPersistenceQueue : OperationQueue = {
        var queue = OperationQueue()
        queue.name = "userPersistenceQueue"
        queue.maxConcurrentOperationCount = 2
        return queue
    }()
    
    func signInUser(withEmail email : String, password : String, completionHandler : @escaping (_ response : Response<Any>) -> ()){
        FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user,error) in
            guard let _ = user, error == nil else {
                print(error!.localizedDescription)
                completionHandler(Response.error((error?.localizedDescription)! ))
                return
            }
            
            completionHandler(Response.success(true))
        })
    }
    
    func signInUser(withCredential credential : FIRAuthCredential, completionHandler : @escaping (_ response : Response<Any>) -> ()){
        FIRAuth.auth()?.signIn(with: credential) { (user, error) in
            
            guard let user = user, error == nil else {
                print(error!.localizedDescription)
                completionHandler(Response.error((error?.localizedDescription)! ))
                return
            }
            
            let operation = UserPersistenceOperation(userOperationType : .checkandsaveuser , completionHandler : {response in
                completionHandler(response)
            })
            operation.user = user
            operation.username = user.email
            
            self.userPersistenceQueue.addOperation(operation)            
        }
    }

}
