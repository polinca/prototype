//
//  WalletService.swift
//  b
//
//  Created by Litvinova Polina on 07/11/2018.
//  Copyright © 2018 Litvinova Polina. All rights reserved.
//

import Foundation

protocol WalletServiceDeligate: class {
    func didGet(wallets: [Wallet])
    func didAdd(succsess: Bool)
    }


protocol WalletService {
    var delegate:WalletServiceDeligate? {get set}
    func addWallet(wallet: Wallet)
    func fetchWallets()
}
class WalletServiceImp: WalletService {
    
    weak var delegate: WalletServiceDeligate?
    var networkService: Network
    
    init(networkService: Network) {
        self.networkService = networkService        
    }

    func addWallet(wallet: Wallet) {
        let url = "https://mybuh.club/Accounts_Controler.php?Class=MainAccounts&Metod1=MobileNewAccount&AccName="+wallet.name
        let options = RequestOptions(url: URL(string: url)!)
        
        _ = networkService.performRequest(options: options, completion: {[unowned self] response, data in
            
       let success = (response as! HTTPURLResponse).statusCode == 200
            
       self.delegate?.didAdd(succsess: success)
            
        })
    }
    
    func fetchWallets()  {
        let URLSTR = "https://mybuh.club/Accounts_Controler.php?Class=MainAccounts&Metod1=MobileGetAccounts&Metod2=MobileDisplay"
        let url = URL (string: URLSTR)
        
        let options = RequestOptions( url: url! )
        
         options.method = .post
        
        _ = networkService.performRequest(options: options, completion: {[unowned self] response, data in
           
            if data != nil {
                let wallets = try?JSONDecoder().decode([Wallet].self, from: data!)
            }
            let success = (response as! HTTPURLResponse).statusCode == 200
            
            self.delegate?.didAdd(succsess: success)
            
        })
        
        
        //let wallets = [
        //    Wallet(name:"Первый кошелек", balance: 5000000),
        //    Wallet(name:"Второй", balance: 200)
       //     ]
       // delegate?.didGet(wallets: wallets)
        
    }

}
