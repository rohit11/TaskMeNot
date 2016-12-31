//
//  ConfigUtil.swift
//  TaskMeNot
//
//  Created by Malinka S on 12/30/16.
//  Copyright © 2016 Rohit Nisal. All rights reserved.
//

import UIKit

class ConfigUtil: NSObject {
    static let sharedInstance = ConfigUtil()
    
    
    var baseURL : String?
    var firebasePlistFileName : String?
    
    
    private override init() {
        super.init()
        //read values configured in the desired config file
        readValuesFromConfig()
    }
    /**
     * Read values configured in the desired config file
     * and assign them to the defined properties
     **/
    private func readValuesFromConfig(){
        var plistDictionary: NSDictionary?
        if let path = Bundle.main.path(forResource: "config_default", ofType: "plist") {
            plistDictionary = NSDictionary(contentsOfFile: path)
        }
        if let configDictionary = plistDictionary!["config"] as! [String : String]! {
            
            baseURL = configDictionary["baseURL"] ?? ""
            firebasePlistFileName = configDictionary["firebasePlistFileName"] ?? ""
            #if DEVELOPMENT
                firebasePlistFileName = configDictionary["firebasePlistFileNameDev"] ?? ""
            #endif
            
        }
    }
}
