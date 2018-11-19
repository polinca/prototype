//
//  AddWalletContracts.swift
//  b
//
//  Created by Litvinova Polina on 07/11/2018.
//  Copyright © 2018 Litvinova Polina. All rights reserved.
//

import Foundation
protocol WalletInput: class {
    func set(wallets:[Wallet])
    func walletAdded (success: Bool)
}
protocol WalletOutput{
    
    var view:WalletInput! { get set }
    
    func getWallets()
    
    func onAddPressed(wallet: Wallet)
    
    
}
