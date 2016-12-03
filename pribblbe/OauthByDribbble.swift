//
//  ViewController.swift
//  pribblbe
//
//  Created by Halik Magomedov on 11/25/16.
//  Copyright © 2016 Haliks. All rights reserved.
//

import UIKit
import p2_OAuth2
import Alamofire

class ViewController: UIViewController {
    
    fileprivate var alamofireManager: SessionManager?
    
    var loader: OAuth2DataLoader?
    
    var userDataRequest: URLRequest {
let request = URLRequest(url: URL(string: "https://api.dribbble.com/v1/user?access_token=")!)
        return request
    }
    func didCancelOrFail(_ error: Error?) {
        DispatchQueue.main.async {
            if error != nil {
                print("errorrrrr")
            }
        }
    }
    func didGetUserdata(_ dict: [String: Any], loader: OAuth2DataLoader?) {
        DispatchQueue.main.async {
        }
    }

    var oauth2 = OAuth2CodeGrant(settings: [
        "client_id": "90e57a4c33ee388b0652d6076a96256cdc44bb8abd8f6e8d2733889aa36ed7d0",
        "client_secret": "767f15024dcb334c7fa546fabbaf8d33c9ac27728c0fdfa6068c1c6d7d21128c",
        "authorize_uri": "https://dribbble.com/oauth/authorize",
        "token_uri": "https://dribbble.com/oauth/token",
        "access_token" : "5c8e7982292e7a921449d857d5a6c5c2695825c14cae8bdf6b3af2f1484eb08e",
        "token_type" : "bearer",
        "scope": "public write comment upload",
        "redirect_uris": ["pribblbee://phone-callback"],
        
        ] as OAuth2JSON)

 
  
    @IBOutlet var loginButton: UIButton!
    @IBAction func login(_ sender: Any) {
        if oauth2.isAuthorizing {
            oauth2.abortAuthorization()
            return
        }
        
        oauth2.authConfig.authorizeEmbedded = true
        oauth2.authConfig.authorizeContext = self
        let loader = OAuth2DataLoader(oauth2: oauth2)
        self.loader = loader
        
        loader.perform(request: userDataRequest) { response in
            do {
                let json = try response.responseJSON()
                self.didGetUserdata(json, loader: loader)
            }
            catch let error {
                self.didCancelOrFail(error)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

