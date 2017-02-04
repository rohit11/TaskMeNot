//
//  NetworkOperation.swift
//  TaskMeNot
//
//  Created by Malinka S on 12/31/16.
//  Copyright © 2016 Rohit Nisal. All rights reserved.
//

import UIKit
import Alamofire

enum HTTPResponse<T> {
    case success(T)
    case failure (String)
    
}



class NetworkOperation: AsynchronousOperation {

    var url : String?
    var method : HTTPMethod?
    var parameters : [String : Any]?
    let completionHandler : (_ httpResponse : HTTPResponse<Any>) -> ()
    var headers : [String : String]  = [ "Accept" : "application/json", "Content-Type" : "application/json"]
    
    init(url : String, method : HTTPMethod,parameters : [String : Any] = [:], completionHandler : @escaping (_ httpResponse : HTTPResponse<Any>) -> ()) {
        self.url = url
        self.method = method
        self.parameters = parameters
        self.completionHandler = completionHandler
    }
    
    override func main() {
        if self.isCancelled {
            return
        }
        
        sendRequest()
    }
    
    
    private func sendRequest(){
        Alamofire.request(createUrl(url: url!), method : method!, parameters : parameters, headers : headers).responseJSON { response in
            
            if response.result.isSuccess {
                if let JSON = response.result.value {
                    log.debug("JSON: \(JSON)")
                }
                
                self.completionHandler(HTTPResponse.success(response.result.value!))
                self.completeOperation()
                
            }
            
        }
    }
    
    
    private func createUrl(url : String) -> String {
        
        return String(format: "%@%@", ConfigUtil.sharedInstance.baseURL!,url)
        
    }
    
    private func logResponse(_ response : DataResponse<Any>){
        log.info(response.request ?? "")  // original URL request
        log.info(response.response ?? "") // HTTP URL response
        log.info(response.data ?? "")     // server data
        log.info(response.result)   // result of response serialization
        log.info(response.timeline)
    }
}
