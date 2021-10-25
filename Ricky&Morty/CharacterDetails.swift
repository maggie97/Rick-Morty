//
//  CharacterDetails.swift
//  Ricky&Morty
//
//  Created by MaggieMendez  on 25/10/21.
//

import SwiftUI

struct CharacterDetails: View {
    let itemCharacter: Character
    @State var firstEpisode: Episode?
    var body: some View {
            
            List{
                if #available(iOS 15.0, *) {
                    AsyncImage(url: itemCharacter.image).fixedSize()

                } else {
                    // Fallback on earlier versions
                }
                if let firstEpisode = firstEpisode {
                    HStack{
                        Text("First Chapter:").bold()
                        Text("\(firstEpisode.name); \(firstEpisode.airDate)")
                        
                    }
                }
                HStack(spacing: 10.0) {
                    
                    Text("Created: ").bold()
                    Text(itemCharacter.created)
                    
                }
                
                HStack(spacing: 10.0) {
                    
                    Text("Status").bold()
                    Text(itemCharacter.status)
                    
                }
                
                HStack(spacing: 10.0) {
                    
                    Text("Location: ").bold()
                    Text(itemCharacter.location.name)
                }
                HStack (spacing: 10){
                    
                    Text("Origin: ").bold()
                    Text(itemCharacter.origin.name)
                
                }
                
                HStack (spacing: 10){
                    Text("Specie").bold()
                    Text(itemCharacter.species)
                }
                
            }.onAppear(perform: loadEpisode)
            .navigationTitle(itemCharacter.name)
            .navigationBarTitleDisplayMode(.large)
    }
    
    func loadEpisode() {
        if let firstEp = itemCharacter.episode.first {
            APIHelper.getJSON(urlString: firstEp) { (result: Result<Episode, APIHelper.APIError>) in
                switch result {
                case .success(let success):
                    firstEpisode = success
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

struct CharacterDetails_Previews: PreviewProvider {

    static var previews: some View {
        CharacterDetails(itemCharacter: Character(id: 1, name: "Toxic Rick", status: "Dead", species: "Humanoid", gender: "Rick's Toxic Side", image: URL(string: "https://rickandmortyapi.com/api/character/avatar/361.jpeg")!, episode: ["https://rickandmortyapi.com/api/episode/1"], origin: Location(name: "Earth", url: "https://rickandmortyapi.com/api/location/20"), location: Location(name: "Alien Spa", url: "https://rickandmortyapi.com/api/location/64"), created: "2018-01-10T18:20:41.703Z"))
    }
}
