//
//  Router.swift
//  myshopify
//
//  Created by Ricardo Rabeto on 18/01/2020.
//  Copyright © 2020 Ricardo Rabeto. All rights reserved.
//

import Foundation
import Alamofire
public enum ImageSize {
    case poster
    case cast
    case backdrop
    
    var size: String{
        switch self{
        case .poster:
            return "200"
        case .cast:
            return "185"
        case .backdrop:
            return "780"
        }
    }
}

public enum Router: URLRequestConvertible {
    case products(page: Int)
    
    enum Constants {
        static let baseURL = "https://shopicruit.myshopify.com/admin/"
        static let ApiKey = "c32313df0d0ef512ca64d5b336a0d7c6"
    }
    
    var method: HTTPMethod {
        switch self {
        default: return .get
        }
    }
    
    var timeOut: Double{
        return TimeInterval(10 * 1000)
    }
    
    
    var path: String {
        switch self {
        case .products:
            return "products.json"
        }
    }
    
    var page: Int {
        switch self {
        case .products(let page):
            return page
        }
    }
    
    var endPoint: String {
        switch self {
        case .products:
            return "products.json"
        }
    }
    
    var parametersWhitPage: [String: Any] {
        switch self {
        default:
            return [
                "access_token": Constants.ApiKey,
                "page": page
            ]
        }
        
    }
    var parameters: [String: Any] {
           switch self {
           default:
               return [
                   "access_token": Constants.ApiKey
               ]
           }
           
       }
    
    public func asURLRequest() throws -> URLRequest {        
        let url = try (Constants.baseURL + endPoint).asURL()
        var request = URLRequest(url: url)
        request.timeoutInterval = timeOut
        request.httpMethod = method.rawValue
        NetworkLogger.log(request: request, params: parameters)
        return try URLEncoding.default.encode(request, with: parameters)
    }
}




