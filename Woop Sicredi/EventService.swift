//
//  EventService.swift
//  Woop Sicredi
//
//  Created by Jeronimo Junior on 27/10/20.
//

import Foundation
import Alamofire


enum Result<T> {
    case success(T)
    case failure(Error)
}

class EventService {
    
    func getEvents(completion: @escaping (Result<[Event]>) -> Void){
         guard let url = URL.init(string: "http://5f5a8f24d44d640016169133.mockapi.io/api/events") else { return }
         
         AF.request(url)
             .validate()
             .responseDecodable(of: [Event].self) { response in
                 switch response.result {
                 case .success(let events):
                     completion(.success(events))
                 case .failure(let error):
                     completion(.failure(error))
                 }
         }
     }
}
