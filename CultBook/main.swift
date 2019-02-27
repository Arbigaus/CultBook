//
//  main.swift
//  CultBook
//
//  Created by Gerson Arbrugaus on 15/02/19.
//  Copyright © 2019 Arbigaus. All rights reserved.
//

import Foundation

class Main {
    var clients     = [ Client ]()
    
    var books       = [ Book ]()
    var ebooks      = [ EBook ]()
    var audioBooks  = [ AudioBook ]()
    var orders      = [ Order ]()
    
    var shopList: Any  = []
    
    init() {
        // Inserir um usuário padrão para teste
        let firstClient = Client()
        firstClient.createClient(name: "Lucky Skywalker", login: "lucky", passwd: "lucky", email: "lsky@jedi.com", phone: "(41) 99999 9999)")
        
        clients.append(firstClient)
        
        // Inserir dois livros padrão para teste
        let lotr = Book()
        lotr.insertBook(isbn: 9780061917707, title: "The Lord of The Ring", description: "The best book of the World", author: "JRR Tolkien", stock: 5, price: 100, insertDate: "20/02/2019", category: "Fantasia")
        
        let holmes = Book()
        holmes.insertBook(isbn: 9783036991276, title: "Sherlock Holmes - Um Estudo em Vermelho", description: "Sherlok Holmes", author: "Doyle,Arthur Conan", stock: 2, price: 50, insertDate: "20/02/2019", category: "Suspense")
        
        books.append(lotr)
        books.append(holmes)
        
        let biblia = AudioBook()
        biblia.insertAudioBook(isbn: 9788840393315, title: "Bíblia", description: "A Bíblia", author: "Deus", price: 50, insertDate: "27/02/2019", category: "Religião", time: "10:00:00", narrator: "Cid Moreira", midia: "mp3")
        
        audioBooks.append(biblia)
        
        let harryDescription: String = "Harry não é mais um garoto. Aos 15 anos, continua sofrendo a rejeição dos Dursdley, sua estranhíssima família no mundo dos trouxas."
        let harryPotter = EBook()
        harryPotter.insertEBook(isbn: 9789544467616, title: "Harry Potter e a Ordem da Fênix", description: harryDescription, author: "J.K. Rowling", price: 35, insertDate: "27/02/2019", category: "Fantasia", size: 189, url: "http://cultbook.com/ebook/hpof.epub", fileType: "epub")
        
        ebooks.append(harryPotter)
        
        startScreen()
    
    }
    
    public func startScreen(){
        print("####### CultBook #######\n")
        print("Bem vindo ao CultBook \n\n")
        print("Selecione uma das opções:\n")
        print(" 1 -> Já tenho cadastro  |  2 -> Fazer cadastro  |  3 -> Cadastrar Livro\n")
        
        let selected = readLine()
        
        switch selected {
        case "1":
            doLogin()
            break
        case "2":
            createClient()
            break
        default:
            escapeLines()
            insertBook()
            break
        }
    }
    
    private func doLogin() {
        escapeLines()
        print("####### CultBook #######\n")
        print("CultBook | Login \n\n")
        
        let login  = checkInput(input: "teu login")
        let passwd = checkInput(input: "tua senha")
        var tempClient : Client = Client()
        var logado : Bool = false
        
        for client in clients {
            if client.login == login && client.passwd == passwd {
                logado = true
                tempClient = client
                continue
            }
        }
        
        if logado == true {
            startShop(client: tempClient)
        } else {
            print("\n Conta não encontrada ou senha incorreta \n")
            print(" 1 -> Tentar de novo  |  2 -> Fazer Cadastro")
            
            let selected = readLine()
            
            switch selected {
            case "1":
                doLogin()
                break
            case "2":
                createClient()
                break
            default:
                insertBook()
                break
            }
            
        }
        
    }
    
    private func startShop(client : Client) {
        escapeLines()
        print("####### CultBook #######\n")
        print("CultBook | Bem Vindo \(client.name) \n\n")
        print("Favor selecionar o tipo de Livro vc quer comprar")
        print(" 1 -> Livros  |  2 -> Audiolivros  |  3 -> ELivros")
        
        let selected = readLine()
        
        switch selected {
        case "1":
            shopBook(client: client)
        case "2":
            shopAudioBook(client: client)
        default:
            shopELivros(client: client)
        }
        
    }
    
    private func shopBook(client: Client) {
        escapeLines()
        print("####### CultBook #######\n")
        print("CultBook | Olá \(client.name) \n\n")
        print("Segue a lista de livros disponiveis")
        
        var i = 1
        for book in books {
            print("\(i) => \(book.title)")
            i += 1
        }
        
        let selected = Int(readLine()!) ?? 0 - 1
        let book = books[selected ?? 0]
        print(book.title)
        
    }
    
    private func shopAudioBook(client: Client) {
        escapeLines()
        print("####### CultBook #######\n")
        print("CultBook | Olá \(client.name) \n\n")
        print("Segue a lista de Audiolivro disponiveis")
        
        var i = 1
        for audioBook in audioBooks {
            print("\(i) => \(audioBook.title)")
            i += 1
        }
        
    }
    
    private func shopELivros(client: Client) {
        escapeLines()
        print("####### CultBook #######\n")
        print("CultBook | Olá \(client.name) \n\n")
        print("Segue a lista de ELivros disponiveis")
        
        var i = 1
        for ebook in ebooks {
            print("\(i) => \(ebook.title)")
            i += 1
        }
    }
    
    private func createClient() {
        escapeLines()
        print("####### CultBook #######\n")
        print("CultBook | Cadastrar \n\n")
        
        let newClient = Client()
        
        let name    = checkInput(input: "o teu nome:")
        let email   = checkInput(input: "o teu e-mail:")
        let login   = checkInput(input: "um login:")
        let passwd  = checkInput(input: "uma senha:")
        let phone   = checkInput(input: "o teu telefone:")
        
        newClient.createClient(name: name, login: login, passwd: passwd, email: email, phone: phone)
        
        clients.append(newClient)
        print("Cadastro efetuado com sucesso")
        print("Pressione Enter para fazer login")
        
        readLine()
        
        doLogin()
        
    }
    
    
    private func checkInput(input: String) -> String {
        print("Favor inserir \(input) :")
        let value: String = readLine() ?? ""
        
        if (value == "") {
            print("O valor não pode ser vazio")
            checkInput(input: input)
        }
        return value
    }
    
    private func selectProductToInsert() {
        print("####### CultBook #######\n")
        print("Cadastro de Produtos \n\n")
        print("Selecione uma das opções:\n")
        print(" 1 -> Cadastrar Livro  |  2 -> Cadastrar ELivro  |  3 -> Cadastrar Audiolivro\n")
        
        let selected = readLine()
        
        switch selected {
        case "1":
            insertBook()
            break
        case "2":
            insertEBook()
            break
        default:
            insertAudioBook()
            break
        }
    }
    
    private func insertBook(){
        escapeLines()
        print("####### CultBook #######\n")
        print("CultBook | Cadastrar Livro \n\n")
        
        let newBook = Book()
        
        let isbn: Int           = Int(checkInput(input: "o ISBN:")) ?? 0
        let title: String       = checkInput(input: "o título do Livro:")
        let description: String = checkInput(input: "a descrição do Livro:")
        let author: String      = checkInput(input: "o nome do Autor:")
        let stock: Int          = Int(checkInput(input: "a quantidade no estoque:")) ?? 0
        let price: Float        = Float(checkInput(input: "o valor do Livro")) ?? 0
        let insertDate: String  = checkInput(input: "a data de inserção")
        let category: String    = checkInput(input: "a Categoria do Livro:")
        
        newBook.insertBook(isbn: isbn, title: title, description: description, author: author, stock: stock, price: price, insertDate: insertDate, category: category)
        
        books.append(newBook)
        
        print("Livro inserido com sucesso")
        print(" 1 -> Cadastrar outro Livro  |  2 -> Sair")
        
        if (readLine() == "1") {
            insertBook()
        } else {
            startScreen()
        }
        
        
    }
    
    private func insertEBook(){
        escapeLines()
        print("####### CultBook #######\n")
        print("CultBook | Cadastrar Livro \n\n")
        
        let newEBook = EBook()
        
        let isbn: Int           = Int(checkInput(input: "o ISBN:")) ?? 0
        let title: String       = checkInput(input: "o título do Livro:")
        let description: String = checkInput(input: "a descrição do elivro:")
        let author: String      = checkInput(input: "o nome do Autor:")
        let price: Float        = Float(checkInput(input: "o valor do elivro")) ?? 0
        let insertDate: String  = checkInput(input: "a data de inserção")
        let category: String    = checkInput(input: "a Categoria do elivro:")
        let url: String         = checkInput(input: "a URL do elivro")
        let fileType: String    = checkInput(input: "o tipo do arquivo (mobi, epub)")
        let size: Float         = Float(checkInput(input: "o tamanho do arquivo (mb)")) ?? 0
        
        newEBook.insertEBook(isbn: isbn, title: title, description: description, author: author, price: price, insertDate: insertDate, category: category, size: size, url: url, fileType: fileType)
        
        ebooks.append(newEBook)
        
        print("Livro inserido com sucesso")
        print(" 1 -> Cadastrar outro Livro  |  2 -> Sair")
        
        if (readLine() == "1") {
            insertEBook()
        } else {
            startScreen()
        }
        
    }
    
    private func insertAudioBook(){
        escapeLines()
        print("####### CultBook #######\n")
        print("CultBook | Cadastrar Livro \n\n")
        
        let newAudioBook = AudioBook()
        
        let isbn: Int           = Int(checkInput(input: "o ISBN")) ?? 0
        let title: String       = checkInput(input: "o título do Livro")
        let description: String = checkInput(input: "a descrição do Livro")
        let author: String      = checkInput(input: "o nome do Autor")
        let price: Float        = Float(checkInput(input: "o valor do Livro")) ?? 0
        let insertDate: String  = checkInput(input: "a data de inserção")
        let category: String    = checkInput(input: "a Categoria do Livro")
        let time: String        = checkInput(input: "o tempo do audio")
        let narrator: String    = checkInput(input: "o nome do narrador")
        let midia: String       = checkInput(input: "o tipo de mídia (mp3)")
        
        newAudioBook.insertAudioBook(isbn: isbn, title: title, description: description, author: author, price: price, insertDate: insertDate, category: category, time: time, narrator: narrator, midia: midia )
        
        audioBooks.append(newAudioBook)
        
        print("Livro inserido com sucesso")
        print(" 1 -> Cadastrar outro Livro  |  2 -> Sair")
        
        if (readLine() == "1") {
            insertAudioBook()
        } else {
            startScreen()
        }
        
    }
    
    private func escapeLines(){
        print("\n\n\n\n\n\n\n\n\n\n\n")
    }
    
}

let run = Main()


