//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Samed Dağlı on 1.01.2023.
//

import UIKit

final class NetworkManager {
    
    static let shared   = NetworkManager()
    
    private let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    let cache           = NSCache<NSString, UIImage>()
    
    private init() {}
    
    
    func getAppetizers(completed: @escaping (Result<[Appetizer], NetworkError>) -> Void) {
        let endpoint = baseURL + "appetizers"
        
        guard let url = URL(string: endpoint) else {
            completed(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let appetizerResponse = try decoder.decode(AppetizerResponse.self, from: data)
                completed(.success(appetizerResponse.request))
            } catch {
                completed(.failure(.invalidData))
            }
        }.resume()
    }
    
    func downloadImage(from urlString: String, completed: @escaping (UIImage?) -> Void) {
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            
            guard let self = self,
                error == nil,
                let response = response as? HTTPURLResponse, response.statusCode == 200,
                let data = data,
                let image = UIImage(data: data) else {
                    completed(nil)
                    return
                }
            
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        
        task.resume()
    }
}
