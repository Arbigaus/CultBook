//
//  Book.swift
//  CultBook
//
//  Created by Gerson Arbrugaus on 20/02/19.
//  Copyright © 2019 Arbigaus. All rights reserved.
//

import Foundation

class Book {
    var isbn        : Int
    var title       : String
    var description : String
    var author      : String
    var stock       : Int
    var price       : Float
    var insertDate  : String
    var category    : String
    
    init() {
        self.isbn        = 0
        self.title       = ""
        self.description = ""
        self.author      = ""
        self.stock       = 0
        self.price       = 0.0
        self.insertDate  = ""
        self.category    = ""
    }
    
    public func insertBook( isbn : Int, title : String, description : String, author : String, stock : Int, price : Float,
                            insertDate : String, category : String ) {
        
        self.isbn        = isbn
        self.title       = title
        self.description = description
        self.author      = author
        self.stock       = stock
        self.price       = price
        self.insertDate  = insertDate
        self.category    = category
    }
    
}

class AudioBook: Book {
    var time     : String
    var narrator : String
    var midia    : String
    
    override init(){
        self.time     = ""
        self.narrator = ""
        self.midia    = "" // exemplo : mp3, midi
        
        super.init()
    }
    
    public func insertAudioBook( isbn : Int, title : String, description : String, author : String, price : Float,
                                 insertDate : String, category : String, time: String, narrator : String, midia : String ) {
        
        self.isbn        = isbn
        self.title       = title
        self.description = description
        self.author      = author
        self.stock       = stock
        self.price       = price
        self.insertDate  = insertDate
        self.category    = category
        self.time        = time
        self.narrator    = narrator
        self.midia       = midia
    }
    
}

class EBook: Book {
    var size     : Float
    var url      : String
    var fileType : String
    
    override init() {
        self.size     = 0.0 // tamanho do arquivo
        self.url      = ""  // url do arquivo para download
        self.fileType = ""  // Tipo do arquivo, ex. PDF, epub
        
        super.init()
    }
    
    public func insertEBook( isbn : Int, title : String, description : String, author : String, price : Float,
                                 insertDate : String, category : String, size: Float, url : String, fileType : String ) {
        
        self.isbn        = isbn
        self.title       = title
        self.description = description
        self.author      = author
        self.stock       = stock
        self.price       = price
        self.insertDate  = insertDate
        self.category    = category
        self.size        = size
        self.url         = url
        self.fileType    = fileType
    }
}
