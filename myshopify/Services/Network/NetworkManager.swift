//
//  NetworkManager.swift
//  myshopify
//
//  Created by Ricardo Rabeto on 18/01/2020.
//  Copyright © 2020 Ricardo Rabeto. All rights reserved.
//

import Foundation
import Alamofire

typealias complection = (ApiResponse?)->()

typealias ImageHandler = (_ image: UIImage?,_ urlString: String?,_ error: String?) ->()

enum NetworkResponse: String {
    case success
    case authenticationError = "You need to be authenticated first."
    case badRequest = "Bad request."
    case outdated = "The url you requested is outdated."
    case failed = "Network request failed."
    case imageFail = "fail to get image."
    case noData = "Response returned with no data to decode."
    case unableToDecode = "We could not decode the response."
}

struct NetworkManager {
    static let shared = NetworkManager()
    

    func listRequest(endPoint: Router, handler: @escaping complection){
        request(endPoint).responseJSON{ resp in
            guard resp.result.isSuccess, let data = resp.data else {
                print(NetworkResponse.noData)
                return
            }
            
            do{
                let apiResponse = try JSONDecoder().decode(ApiResponse.self, from: data)
                handler(apiResponse)
            }catch{
                print(NetworkResponse.unableToDecode)
            }
        }
        
        
    }
}

class Connectivity {
    class var isConnectedToInternet:Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
}
