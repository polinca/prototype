//
//  AddWalletPresenter.swift
//  b
//
//  Created by Litvinova Polina on 07/11/2018.
//  Copyright © 2018 Litvinova Polina. All rights reserved.
//

import Foundation

class WalletPresenter {

    weak var view: WalletInput!
    
    var walletService: WalletService
    
    init(view: WalletInput,
         walletService:WalletService){
        self.view = view
        self.walletService = walletService
        self.walletService.delegate = self
    }
    
}
    //MARK: WalletServiceDeligate
    
extension WalletPresenter: WalletOutput {
    
    
    
    func onAddPressed(wallet: Wallet) {
        walletService.addWallet(wallet: wallet)
    }
    
        
        func getWallets() {
            walletService.fetchWallets()
        }
    
        
    }
    
extension WalletPresenter: WalletServiceDeligate {
    func didAdd(succsess: Bool) {
        /// view.set(wallets: [wallets] )
        view.walletAdded(success: succsess)
    }
    

    func didGet(wallets: [Wallet]) {
            view.set(wallets: wallets)
            
        }
    }

