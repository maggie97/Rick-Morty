//
//  ContentView.swift
//  Ricky&Morty
//
//  Created by MaggieMendez  on 24/10/21.
//

import SwiftUI

struct ContentView: View {
    //let characters = Bundle.main.decode(Character.self)
    @State var results: [Character] = [Character]()
    @State var pageNumber: Int = 1
    
    var body: some View {
        NavigationView {
            List(results, id:\.id){ item in
                CharacterItemList(item: item)
                    
            }.onAppear(perform: loadData)
            .navigationTitle("Rick and Morty")
            .navigationBarTitleDisplayMode(.automatic)
            .padding(-10)
                
        }
        
    }
    
    func loadData(){
        APIHelper.getJSON(urlString: "\(ApiURL.base.rawValue)\(ApiURL.Seccion.character)/?page=\(pageNumber)") { (result: Result< CharacterList, APIHelper.APIError>) in
            switch result {
            case .success(let success):
                results = (success.results)
                if let nextURL = success.info.next {
                    loadMore(url: nextURL)
                }
            case .failure(let failure):
                switch failure{
                case .error(let errorString):
                    print(errorString)
                }
            }
        }
    }
    
    func loadMore(url: String){
        DispatchQueue.main.async {
            APIHelper.getJSON(urlString: url){ (result: Result< CharacterList, APIHelper.APIError>) in
                switch result {
                case .success(let success):
                    results.append(contentsOf: success.results)
                    if let nextURL = success.info.next {
                        loadMore(url: nextURL)
                    }
                case .failure(let failure):
                    switch failure{
                    case .error(let errorString):
                        print(errorString)
                    }
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

struct CharacterItemList: View{
    @State var item: Character
    var body: some View {
        NavigationLink(destination: CharacterDetails(itemCharacter: item)) {
            HStack{
                if #available(iOS 15.0, *) {
                    AsyncImage(url: item.image, scale: 3).frame(minWidth: 50, idealWidth: 90, maxWidth: 100, minHeight: 50, idealHeight: 90, maxHeight: 100, alignment: .center)
                } else {
                    Rectangle().fill(Color.red).frame(width: 100, height: 100, alignment: .leading)
                }

                VStack(alignment: .leading){
                    Text(item.name)
                        .fontWeight(.black).padding(0)
                    HStack{
                        Circle()
                            .fill(Status(rawValue: item.status)?.getColor() ?? Color.black )
                            .frame(width: 8, height: 8)
                            .padding(0)
                            
                        Text(item.status)
                            .fontWeight(.light)
                            .font(.system(size: 12))
                            .multilineTextAlignment(.leading)
                            .padding(0)
                    }
                    .padding(0.0)
                    
                    Text("Last Know location").foregroundColor(Color.gray)
                        .font(.system(size: 16))
                    Text(item.location.name).font(.system(size: 12))
                    
                }.padding(0)
            }.padding(0)
        }
        
    }
}
