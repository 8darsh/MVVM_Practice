//
//  MatchesViewModel.swift
//  MVVM_Practice
//
//  Created by Adarsh Singh on 05/09/23.
//

import Foundation

final class MatchesViewModel{
    
    var matches:Matches?
    
    var eventHandler: ((_ event: Event) -> Void)?
    
    func fetchMatch(){
        self.eventHandler?(.loading)
        ApiManager.shared.fetchData{ response in
            
            self.eventHandler?(.stopLoading)
            
            switch response{
                
            case .success(let match):
                
                
                self.matches = match
                
                self.eventHandler?(.dataLoaded)
                
            case .failure(let error):
                self.eventHandler?(.error(error))
            }
            
        }
    }
}

extension MatchesViewModel{
    
    enum Event{
        case loading
        case stopLoading
        case dataLoaded
        case error(Error?)
    }
}
