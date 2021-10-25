//
//  ContentView.swift
//  Ricky&Morty
//
//  Created by MaggieMendez  on 24/10/21.
//

import SwiftUI

struct ContentView: View {
    //let characters = Bundle.main.decode(Character.self)
    @State var results: CharacterList = CharacterList(results: [Character]())
    
    var body: some View {
        NavigationView {
            List(results.results, id:\.id){ item in
                HStack{
                    Rectangle().fill(Color.red).frame(width: 100, height: 100, alignment: .leading)
                    VStack{
                        Text(item.name)
                    }
                }
            }.onAppear(perform: loadData)
                .navigationTitle("RickAndMorty")
                .navigationBarTitleDisplayMode(.automatic)
        }
        
    }
    
    func loadData(){
        APIHelper.getJSON(urlString: "https://rickandmortyapi.com/api/character") { (result: Result< CharacterList, APIHelper.APIError>) in
            switch result {
            case .success(let success):
                results = success
            case .failure(let failure):
                switch failure{
                case .error(let errorString):
                    print(errorString)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
