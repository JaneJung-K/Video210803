//
//  VideoManager.swift
//  Video210803
//
//  Created by Mingeun Yang on 2021/08/03.
//

import Alamofire

struct VideoManager {
    
    func getVideo(completion: @escaping (Welcome) -> Void) {
        
        let headers: HTTPHeaders = [
            "Authorization": "563492ad6f9170000100000130d4d4134d934e1ab03e08d12a6716ac",
            "Accept": "application/json"
        ]
        
        let url = "https://api.pexels.com/videos/popular"
        
        AF.request(url, method: .get, headers: headers)
            .validate()
            .responseDecodable(of: Welcome.self) { response in
                switch response.result {
                    case .success(let response):
                    completion(response)
                    case .failure(let error):
                        print(error.localizedDescription)
                }
            }
    }
}

