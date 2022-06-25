//
//  FeedDataManager.swift
//  CatStaGram
//
//  Created by 유재호 on 2022/05/08.
//

import Alamofire


//클라이언트와 서버를 연결해줌
class FeedDataManager {
    func feedDataManager(_ parameters : FeedAPIInput, _ viewController : HomeViewController) {
        AF.request("https://api.thecatapi.com/v1/images/search", method: .get, parameters: parameters).validate().responseDecodable(of: [FeedModel].self) { response in
            switch response.result {
            case .success(let result):
                viewController.successAPI(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
