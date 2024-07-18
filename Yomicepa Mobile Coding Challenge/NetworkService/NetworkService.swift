//
//  NetworkService.swift
//  Yomicepa Mobile Coding Challenge
//
//  Created by Michael Hany on 17/07/2024.
//

import Foundation

class NetworkService {
    
    //MARK: - Post Data
    func postData(url: URL, parameters: [String: Any], completion: @escaping (Result<Any, Error>) -> Void) {
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: parameters, options: [])
            request.httpBody = jsonData
        } catch {
            completion(.failure(error))
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                do {
                    let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
                    completion(.success(jsonObject))
                } catch {
                    completion(.failure(error))
                }
            } else {
                completion(.failure(NSError(domain: "NetworkService", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid response"])))
            }
        }.resume()
    }
    
    //MARK: - Get Data of Array
    func getData<T: Decodable>(url: URL, completion: @escaping (Result<[T], Error>) -> Void) {
        if let token = UserDefaults.standard.string(forKey: "token") {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                } else if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        let decodedObject = try decoder.decode([T].self, from: data)
                        completion(.success(decodedObject))
                    } catch {
                        completion(.failure(error))
                    }
                } else {
                    completion(.failure(NSError(domain: "NetworkService", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid response"])))
                }
            }.resume()
        }
    }
    
    //MARK: - Get Data of Single Object
    func getData<T: Decodable>(url: URL, completion: @escaping (Result<T, Error>) -> Void) {
        if let token = UserDefaults.standard.string(forKey: "token") {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                } else if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        let decodedObject = try decoder.decode(T.self, from: data)
                        completion(.success(decodedObject))
                    } catch {
                        completion(.failure(error))
                    }
                } else {
                    completion(.failure(NSError(domain: "NetworkService", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid response"])))
                }
            }.resume()
        }
    }
}
