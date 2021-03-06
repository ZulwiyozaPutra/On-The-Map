//
//  ParseConstant.swift
//  On The Map
//
//  Created by Zulwiyoza Putra on 2/15/17.
//  Copyright © 2017 zulwiyozaputra. All rights reserved.
//

import Foundation

extension Parse {
    
    struct Constants {
        static let ApplicationID = "QrX47CA9cyuGewLdsL7o5Eb8iug6Em8ye0dnAbIr"
        static let ApiKey = "QuWThTdiRmTux3YaDseUSEpUKo7aBYM737yKd4gY"
        static let ApiScheme = "https"
        static let ApiHost = "parse.udacity.com"
        static let ApiPath = "/parse"
        static let JSONApplication = "application/json"

    }
    
    struct Method {
        static let StudentLocation = "/classes/StudentLocation"
    }
    
    enum Write: String {
        case PUT = "PUT"
        case POST = "POST"
    }
    
    struct ParameterKeys {
        static let ApiKey = "X-Parse-REST-API-Key"
        static let ApplicationID = "X-Parse-Application-Id"
        static let SessionID = "session_id"
        static let RequestToken = "request_token"
        static let Query = "query"
        static let Where = "where"
        static let UniqueKey = "uniqueKey"
        static let ContentType = "Content-Type"
        
    }
    
    
    
}
