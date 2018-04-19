//
//  SomeFile.swift
//  HelloWorldKit
//
//  Created by Pierluigi Cifani on 16/04/2018.
//  Copyright © 2018 Pierluigi Cifani. All rights reserved.
//

import RxSwift
import Moya

public typealias UserCredentials = (user: String, password: String)

public protocol LoginService {
    func loginWith(credentials: UserCredentials) -> Single<()>
}

public typealias HeadersConfig = (deviceType: String, iosVersion: String, appVersion: String)

protocol NetworkService {
    init(config: HeadersConfig)
}

public class SomeLoginService: LoginService {

    public init() {

    }

    public func loginWith(credentials: UserCredentials) -> Single<()> {
        fatalError()
    }
}

struct BaseTarget: TargetType {
    let baseURL: URL
    let path: String
    let method: Moya.Method
    var sampleData: Data
    let task: Task
    let headers: [String : String]?
    let headersConfig: HeadersConfig

    private static func privaliaDefaultHeaders(config: HeadersConfig) -> [String:String] {
        return ["x-privalia-app": "app",
                "x-privalia-device": config.deviceType,
                "x-privalia-platform-system": "iOS",
                "x-privalia-platform-system-version": config.iosVersion,
                "x-privalia-app-version": config.appVersion,
                "Content-Type": "application/x-www-form-urlencoded"]
    }

    init(config: HeadersConfig, baseUrl: URL, path: String = "", method: Moya.Method = .get, sampleData: Data = Data(), customHeaders: [String:String]? = nil, parameters: [String:Any]? = nil, parametersEncoding: ParameterEncoding = URLEncoding.default) {
        self.baseURL = baseUrl
        self.path = path
        self.method = method
        self.sampleData = sampleData
        self.headers = BaseTarget.privaliaDefaultHeaders(config: config)
        self.headersConfig = config

        if let parameters = parameters {
            self.task = .requestParameters(parameters: parameters, encoding: parametersEncoding)
        } else {
            self.task = .requestPlain
        }
    }
}
