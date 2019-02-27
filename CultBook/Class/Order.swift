//
//  Order.swift
//  CultBook
//
//  Created by Gerson Arbrugaus on 20/02/19.
//  Copyright © 2019 Arbigaus. All rights reserved.
//

import Foundation

class Order {
    var idOrder      : Int
    var dateOrder    : String
    var paymentType  : String
    var totalPrice   : Float
    var status       : Status
    var orderAddress : Address
    
    var items = [ OrderItems ] () // Order.items.append //
    
    init() {
        self.idOrder      = 0
        self.dateOrder    = ""
        self.paymentType  = ""
        self.totalPrice   = 0.0
        self.status       = .closed
        self.orderAddress = Address()
    }
    
}

class OrderItems : updatePrice {
    
    let item : Book
    var qtde : Int
    
    init() {
        self.item = Book()
        self.qtde = 0
    }
    
    func getPrice() -> Float {
        return self.item.price * Float(self.qtde)
    }
}

enum Status {
    case opened
    case closed
}

protocol updatePrice {
    func getPrice() -> Float
}
