//
//  NetworkError.swift
//  myLibri
//
//  Created by Daniil Konashenko on 18.06.2023.
//

import Foundation

public enum NetworkError: String, Error {
    case parametersNil  = "Parameters were nil."
    case encodingFailed = "Parameter encoding failed."
    case missingURL     = "URL is nil."
    case nonConnection  = "Please check your network connection."
    case badResponse    = "Response don't casted to HTTPURLResponse."
}
