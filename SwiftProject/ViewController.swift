//
//  ViewController.swift
//  SwiftProject
//
//  Created by hao ke on 2022/2/15.
//

import UIKit


import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        requsetHttp(aa: "1234567")
    }

    
    
    
    
    func requsetHttp(aa:String) -> Void {
        
        let urls:String = "http://bs.ifengstar.com/b03/appInfo/getInfo"
        let parameters:Dictionary = ["mac":"455049322155","channelNum":"1","dataType":"0","steamType":"0","port":"8025"];
        
        
        
        
        
        
        
        
        var header  =   HTTPHeaders();
        
        
        
        header.add(name: "Content-Type", value: "application/json");
        AF.request(urls, method: .get, parameters: parameters, encoder: URLEncodedFormParameterEncoder.default, headers: header).responseString { (response) in
            
            
            
            
            
            
            
            let value:String   =   response.value ?? "1234567"
            
            
            
            print("response======"+value)
            
            
            
            
            DispatchQueue.main.async {
                self.alertMessage(message: value);
            }
            
        }
        
        
        
        
    
        
        
    }
    
    
    
    func alertMessage(message:String) -> Void {
        let alertController   =  UIAlertController.init(title: "aa", message: message, preferredStyle: .alert)
    
        let action   =   UIAlertAction.init(title: "ok", style: .destructive) { (aa) in
            
        }
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil);
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

