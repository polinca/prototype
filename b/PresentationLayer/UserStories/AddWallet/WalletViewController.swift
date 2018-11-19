//
//  AddWalletViewController.swift
//  b
//
//  Created by Litvinova Polina on 07/11/2018.
//  Copyright © 2018 Litvinova Polina. All rights reserved.
//

import UIKit

class WalletViewController: UIViewController {
 
    @IBOutlet weak var table: UITableView!
    
    @IBOutlet weak var TextFieldName: UITextField!
    
    
    var presenter: WalletOutput!
    var wallets:[Wallet]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        assembly()
        presenter.getWallets()

    }
    func assembly (){
        let network = URLSessionNetwork()
        let service = WalletServiceImp(networkService: network)
        let presenter = WalletPresenter(view: self, walletService: service)
        self.presenter = presenter
   }

    @IBAction func onAddPressed() {
        
       
       
     if let txtfname = TextFieldName.text
        {
          let newwallet = Wallet.init(name: "текст", balance: 0)
          self.presenter.onAddPressed(wallet: newwallet)
        }
    }
}



extension WalletViewController: WalletInput{
    func walletAdded(success: Bool) {
        if success{
            presenter.getWallets()
        } else {
            //alert
        }
    }
    
    
    func set(wallets: [Wallet]) {
        print(wallets)
        self.wallets = wallets
        table.reloadData()
        
    }
}

extension WalletViewController: UITableViewDataSource,
                                UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wallets?.count ?? 0
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell (style: .subtitle, reuseIdentifier: "walletСell")
        
        
        let wallet = wallets![indexPath.row]
        
        cell.textLabel?.text = wallet.name
        cell.detailTextLabel?.text = "\(wallet.balance)"
        
        
        return cell
        
        
        }
    
    
   
    
}
