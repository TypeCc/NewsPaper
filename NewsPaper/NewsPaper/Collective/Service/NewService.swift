//
//  NewService.swift
//  NewsPaper
//
//  Created by serif mete on 16.03.2023.
//

import Alamofire

enum NewsPaperServiceEndPoint: String {
    case BASE_URL = "https://newsapi.org/v2/top-headlines?country=tr&category=business&apiKey="
    case APİ_KEY = "0bbd4b4f5c854c48b3d79e0075424ed8"
    
    static func api() -> String {
        return BASE_URL.rawValue + APİ_KEY.rawValue
    }
}

protocol INewsPaperService {
    func fetchAllData(response: @escaping ([Article]?) -> Void )
}

struct NewsPaperService: INewsPaperService {
    func fetchAllData(response: @escaping ([Article]?) -> Void) {
        AF.request(NewsPaperServiceEndPoint.api()).responseDecodable(of: NewsModel.self) {
            (model) in
            guard let data = model.value else {
                response(nil)
                return
            }
            response(data.articles)
        }
    }
   
}
