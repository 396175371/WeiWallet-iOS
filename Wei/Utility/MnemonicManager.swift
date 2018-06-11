//
//  MnemonicManager.swift
//  Wei
//
//  Created by yuzushioh on 2018/04/01.
//  Copyright © 2018 popshoot All rights reserved.
//

import EthereumKit

protocol MnemonicManagerProtocol {
    func create() -> [String]
    func createSeed(mnemonic: [String]) throws -> Data
}

final class MnemonicManager: MnemonicManagerProtocol {
    
    private let language: WordList
    
    init() {
        switch Locale.preferredLanguages[0] {
        case "ja-JP":
            self.language = .japanese
        default:
            self.language = .english
        }
    }
    
    func create() -> [String] {
        return Mnemonic.create(strength: .normal, language: language)
    }
    
    func createSeed(mnemonic: [String]) throws -> Data {
        return try Mnemonic.createSeed(mnemonic: mnemonic)
    }
}
