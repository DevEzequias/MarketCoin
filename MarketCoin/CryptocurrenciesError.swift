//
//  CryptocurrenciesError.swift
//  MarketCoin
//
//  Created by Ezequias Santos on 10/10/23.
//

import Foundation

enum CryptocurrenciesError: Error {
    case internalServerError
    case badRequestError
    case notFoundError
    case undefineError
    
    var errorDescription: String {
        switch self {
        case .internalServerError:
            return "Ocorreu um erro no servidor! Gostaria de tentar novamente?"
        case .badRequestError:
            return "Sua requisição não foi bem sucedida! Gostaria de tentar novamente?"
        case .notFoundError:
            return "O serviço que você está buscando não existe! Gostaria de tentar novamente?"
        case .undefineError:
            return "Ocorreu um erro! Gostaria de tentar novamente?"
        }
    }
}
