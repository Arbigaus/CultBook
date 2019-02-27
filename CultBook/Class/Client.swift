//
//  Client.swift
//  CultBook
//
//  Created by Gerson Arbrugaus on 20/02/19.
//  Copyright © 2019 Arbigaus. All rights reserved.
//

import Foundation

class Client {
    var name    : String
    var login   : String
    var passwd  : String
    var email   : String
    var phone   : String
    
    var address : Address
    
    init () {
        self.name   = ""
        self.login  = ""
        self.passwd = ""
        self.email  = ""
        self.phone  = ""
        
        self.address = Address()
    }
    
    public func createClient(name: String, login: String, passwd: String, email: String, phone: String ) {
        self.name   = name
        self.login  = login
        self.passwd = passwd
        self.email  = email
        self.phone  = phone
        
    }
    
}

class Address {
    var street : String
    
    init() {
        self.street = ""
    }
}
