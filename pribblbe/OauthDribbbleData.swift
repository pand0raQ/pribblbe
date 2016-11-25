//
//  Oauth.swift
//  pribblbe
//
//  Created by Halik Magomedov on 11/25/16.
//  Copyright © 2016 Haliks. All rights reserved.
//

import Foundation
import Alamofire
import p2_OAuth2

fileprivate var alamofireManager: SessionManager?

var loader: OAuth2DataLoader?

var oauth2 = OAuth2CodeGrant(settings: [
    "client_id": "90e57a4c33ee388b0652d6076a96256cdc44bb8abd8f6e8d2733889aa36ed7d0",                         
    "client_secret": "767f15024dcb334c7fa546fabbaf8d33c9ac27728c0fdfa6068c1c6d7d21128c",
    "authorize_uri": "https://dribbble.com/oauth/authorize",
    "token_uri": "https://dribbble.com/oauth/token",
    "scope": "public+write+comment+upload",
    "redirect_uris": ["pribblbee://oauth/callback"],
    "secret_in_body": true,
    "verbose": true,
    ] as OAuth2JSON)
