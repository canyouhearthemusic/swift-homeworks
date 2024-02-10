import Foundation

class Book {
    private var title: String
    private var author: String
    private var year: UInt16
    private var pageCount: UInt16
    
    init(title: String, author: String, year: UInt16, pageCount: UInt16) {
        self.title = title
        self.author = author
        self.year = year
        self.pageCount = pageCount
    }
    
    public func displayInfo() {
        print("Title: \(title)\nAuthor: \(author)\nYear: \(year)\nPage Count: \(pageCount)\n")
    }
    
    public func getTitle() -> String {
        return title
    }
    
}

class Library {
    private var books: [Book] = []
    
    static let shared = Library()
    
    private init() {}
    
    func addBook(_ book: Book) {
        books.append(book)
    }
    
    func deleteBook(title: String) {
        guard let index = books.firstIndex(where: {$0.getTitle() == title}) else {
            print("There is no such book")
            return
        }
        
        books.remove(at: index)
        print("Book has been deleted from the library!\n")
    }
    
    func displayAllBooks() {
        books.forEach { book in
            book.displayInfo()
        }
    }
}

// Creating books
let warAndPeace = Book(title: "War and Peace", author: "Leo Tolstoy", year: 1867, pageCount: 1296)
let harryPotter = Book(title: "Harry Potter and the Philosoper's Stone", author: "J.K. Rowling", year: 1997, pageCount: 223)

// Getting library instance
let library = Library.shared


// Adding to a library
library.addBook(warAndPeace)
library.addBook(harryPotter)

// Displaying all books
library.displayAllBooks()

// Deleting book from the library by title
library.deleteBook(title: "War and Peace")

// Display all books again but this time War and Peace by Leo Tolstoy didn't display since deleting
library.displayAllBooks()
