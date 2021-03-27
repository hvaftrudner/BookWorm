//
//  AddBookView.swift
//  BookWorm
//
//  Created by Kristoffer Eriksson on 2021-03-27.
//

import SwiftUI

struct AddBookView: View {
    
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = ""
    @State private var review = ""
    
    var hasValidEntry: Bool {
        if title.isEmpty || author.isEmpty || genre.isEmpty || review.isEmpty {
            return false
        }
        else {
            return true
        }
    }
    
    @State private var isShowingValidationAlert = false
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Name of book", text: $title)
                    TextField("Authors name", text: $author)
                    
                    Picker("Genre", selection: $genre){
                        ForEach(genres, id: \.self){
                            Text($0)
                        }
                    }
                }
                
                Section{
                    RatingView(rating: $rating)
                    TextField("Write a review", text: $review)
                }
                
                Section {
                    Button("Save"){
                        let newBook = Book(context: self.moc)
                        newBook.title = self.title
                        newBook.author = self.author
                        newBook.rating = Int16(self.rating)
                        newBook.genre = self.genre
                        newBook.review = self.review
                        newBook.date = Date()
                        
                        if hasValidEntry {
                            try? self.moc.save()
                            
                            self.presentationMode.wrappedValue.dismiss()
                        } else {
                            self.isShowingValidationAlert = true
                        }
                        
                    }
                }
            }
            .navigationBarTitle("Add Book")
            .alert(isPresented: $isShowingValidationAlert){
                Alert(title: Text("Failed"), message: Text("please fill in all entries"), dismissButton: .default(Text("ok")))
            }
        }
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
