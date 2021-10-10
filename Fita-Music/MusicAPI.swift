//
//  MusicAPI.swift
//  Fita-Music
//
//  Created by Ervan Dharmawan on 10/10/21.
//

import Foundation
protocol MusicAPI{
    func searchByQuery(query: String, completion: @escaping (Result<QueryResultModel, Error>) -> Void)
}
class MusicAPIImpl: MusicAPI{
    static var instance = MusicAPIImpl()
    let url = "https://itunes.apple.com/search?entity=musicTrack&term="
    
    func searchByQuery(query: String, completion: @escaping (Result<QueryResultModel, Error>) -> Void) {
        let query = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? query
        let url = self.url + query
        debugPrint(url)
        URLSession.shared.dataTask(with: URL(string: url)!) { data, response, error in
            do {
                guard let data = data else {
                    return
                }
                let result = try JSONDecoder().decode(QueryResultModel.self, from: data)
                completion(.success(result))
            }catch{
                print(error.localizedDescription)
                completion(.failure(error))
            }
        }.resume()
    }
}
