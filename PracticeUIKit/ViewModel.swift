//
//  ViewModel.swift
//  PracticeUIKit
//
//  Created by devdchaudhary on 22/02/23.
//

import Foundation
import UIKit

extension ViewController {
    
    @objc func fetchJokes(refreshControl: UIRefreshControl?) {
        
        let url = URL(string: "https://api.chucknorris.io/jokes/random")
                
        if let url {
            APIManager.shared.fetchJokeData(url: url) { [unowned self] result in
                switch result {
                case .success(let jokes):
                    DispatchQueue.main.async {
                        for joke in jokes {
                            self.jokesList.insert(joke, at: 0)
                        }
                        self.tableVieww.reloadData()
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
        refreshControl?.endRefreshing()
    }
    
    @objc func refreshTable() {
        
        fetchJokes(refreshControl: nil)
        
    }
    
}
