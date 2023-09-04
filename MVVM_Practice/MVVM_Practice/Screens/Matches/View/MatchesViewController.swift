//
//  MatchesViewController.swift
//  MVVM_Practice
//
//  Created by Adarsh Singh on 05/09/23.
//

import UIKit

class MatchesViewController: UIViewController {

    private var viewModel = MatchesViewModel()
    
    @IBOutlet weak var matchTabelView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configuration()
    }

}

extension MatchesViewController{
    
    func configuration(){
        
        matchTabelView.register(UINib(nibName: "MatchesCell", bundle: nil), forCellReuseIdentifier: "MatchesCell")
        initViewModel()
        observeEvent()
    }
    
    func initViewModel(){
        
        viewModel.fetchMatch()
        
    }
    
    func observeEvent(){
        
        viewModel.eventHandler = { [weak self] event in
            
            guard let self else {return}
            
            switch event{
                
            case .loading:
                print("matches loading")
            case .stopLoading:
                print("Stop Loading")
            case .dataLoaded:
                DispatchQueue.main.async {
                    self.matchTabelView.reloadData()
                }
            case .error(let error):
                print(error ?? "hehe")
            }
        }
        
    }
    
}

extension MatchesViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.matches?.data.count ?? 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: MatchesCell = tableView.dequeueReusableCell(withIdentifier: "MatchesCell", for: indexPath) as? MatchesCell else{
            return UITableViewCell()
        }
        
        let match = viewModel.matches?.data[indexPath.row]
        cell.matches = match
        
        return cell
    }
    
    
}
