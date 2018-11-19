//
//  Wallet.swift
//  b
//
//  Created by Litvinova Polina on 09/11/2018.
//  Copyright © 2018 Litvinova Polina. All rights reserved.
//


class Wallet: Codable {

    var name = ""
    var balance: Float = 0

    init (name: String, balance: Float){
        self.name = name
        self.balance = balance
    }
   
    enum Coding: String, CodingKey {
        case name = "AccName"
        case balance = "Summ"
    }
}
