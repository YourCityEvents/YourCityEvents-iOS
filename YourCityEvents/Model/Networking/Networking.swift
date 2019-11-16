//
//  Networking.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 11/14/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import Foundation

enum CustomError: LocalizedError {
    case runtime(String)
    case undefined
    
    var errorDescription: String? {
        switch self {
        case .runtime(let value):
            return value
        case .undefined:
            return "Undefined error"
        }
    }
}

enum HTTPMethod: String {
    case POST
    case GET
    case PATCH
    case DELETE
    case PUT
}

struct EndpointCollection { }

struct Endpoint {
    var method: HTTPMethod
    var pathEnding: String
}

extension Endpoint {
    
    var url: URL {
        let pathString = Config.basePath /*+ Config.apiVersion*/ + pathEnding
        return URL(string: pathString.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!)!
    }
    
}

enum Result<T> {
    case success(T)
    case failure(Error)
}

class NetworkingService {
    
    private let urlSession = URLSession.shared
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    func performRequest<D: Encodable, R: Decodable>(to endpoint: Endpoint, with jsonData: D, completion: @escaping (Result<R>) -> Void) {
        print("Requesting \(endpoint) with \(jsonData)")
        var data: Data
        do {
            data = try encoder.encode(jsonData)
        } catch {
            completion(.failure(error))
            return
        }
        request(to: endpoint, with: data) { [weak self] (data, response, error) in
            guard let strongSelf = self else { return }
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                do {
                    let response = try strongSelf.decoder.decode(Response<R>.self, from: data)
                    if let errors = response.errors {
                        completion(.failure(CustomError.runtime(errors.joined(separator: ", "))))
                    } else {
                        guard (R.self != Empty.self) else {
                            completion(.success(Empty() as! R))
                            return
                        }
                        completion(.success(response.data!))
                        return
                    }
                } catch {
                    print("Code: \((response as? HTTPURLResponse)?.statusCode ?? -1) Data: ", String(data: data, encoding: .utf8) ?? "nil")
                    completion(.failure(error))
                    return
                }
            } else {
                completion(.failure(CustomError.undefined))
                return
            }
        }
    }
    
    func performRequest<D: Encodable>(to endpoint: Endpoint, with jsonData: D, completion: @escaping (Error?) -> Void) {
        print("Requesting \(endpoint) with \(jsonData)")
        var data: Data
        do {
            data = try encoder.encode(jsonData)
        } catch {
            completion(error)
            return
        }
        request(to: endpoint, with: data) { (data, res, error) in
            completion(error)
            return
        }
    }
    
    func performRequest(to endpoint: Endpoint, completion: @escaping (Error?) -> Void) {
        print("Requesting \(endpoint)")
        request(to: endpoint, with: nil) { (_, _, error) in
            completion(error)
            return
        }
    }
    
    func performRequest<R: Decodable>(to endpoint: Endpoint, completion:  @escaping (Result<R>) -> Void) {
        print("Requesting \(endpoint)")
        request(to: endpoint, with: nil) { [weak self] (data, response, error) in
            guard let strongSelf = self else { return }
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                do {
                    let response = try strongSelf.decoder.decode(Response<R>.self, from: data)
                    if let errors = response.errors {
                        completion(.failure(CustomError.runtime(errors.joined(separator: ", "))))
                    } else {
                        guard (R.self != Empty.self) else {
                            completion(.success(Empty() as! R))
                            return
                        }
                        completion(.success(response.data!))
                        return
                    }
                } catch {
                    print("Code: \((response as? HTTPURLResponse)?.statusCode ?? -1) Data: ", String(data: data, encoding: .utf8) ?? "nil")
                    completion(.failure(error))
                    return
                }
            } else {
                completion(.failure(CustomError.undefined))
                return
            }
        }
    }
    
    private func request(to endpoint: Endpoint, with data: Data?, responseHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        var request = URLRequest(url: endpoint.url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        if let token = User.current?.token {
            print("Using token:", token)
            request.addValue("Bearer " + token, forHTTPHeaderField: "Authorization")
        } else {
            print("No token")
        }
        request.httpMethod = endpoint.method.rawValue
        request.httpBody = data
        urlSession.dataTask(with: request, completionHandler: { (data, response, error) in
            // Check for expired token
            /*
            guard (response as? HTTPURLResponse)?.statusCode != 401  else {
                let defaultsService = UserDefaultsService()
                guard let login = defaultsService.login,
                    let password = defaultsService.password,
                    let signInData = try? self?.encoder.encode(SignInRequest(login: login, password: password)) else {
                        print("Can't find stored credentials")
                        // Log out
                        defaultsService.clear()
                        DispatchQueue.main.async {
                            NotificationCenter.default.post(name: NSNotification.Name.routeApp, object: nil)
                        }
                    return
                }
                
                self?.request(to: EndpointCollection.signIn, with: signInData, responseHandler: { (_data, _, _) in
                    if let _data = _data {
                        let response = try? self?.decoder.decode(Response<SignInResponse>.self, from: _data)
                        UserDefaultsService().token = response?.data?.token
                    }
                    
                    self?.request(to: endpoint, with: data, responseHandler: responseHandler)
                })
                return
            }
            */
            responseHandler(data, response, error)
        }).resume()
    }
    
}
