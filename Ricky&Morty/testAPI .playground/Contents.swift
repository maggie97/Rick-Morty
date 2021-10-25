import UIKit

var greeting = "Hello, playground"



APIHelper.getJSON(urlString: "https://rickandmortyapi.com/api/character") { (result: Result< CharacterList, APIHelper.APIError>) in
    switch result {
    case .success(let success):
        print(success)
    case .failure(let failure):
        switch failure{
        case .error(let errorString):
            print(errorString)
        }
    }
}
