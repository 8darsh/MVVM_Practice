//
//  MatchesCell.swift
//  MVVM_Practice
//
//  Created by Adarsh Singh on 05/09/23.
//

import UIKit

class MatchesCell: UITableViewCell {
    
    @IBOutlet var bgView: UIView!
    @IBOutlet var matchDescription: UILabel!
    
    @IBOutlet var team1Img: UIImageView!
    
    @IBOutlet var team2Img: UIImageView!
    
    @IBOutlet var scoreLbl: UILabel!
    
    @IBOutlet var scoreLbl2: UILabel!
    
    @IBOutlet var matchStatus: UILabel!
    
    
    
    var matches: AboutMatch?{
        didSet{
            matchConfiguration()
        }
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        bgView.clipsToBounds = false
        bgView.layer.cornerRadius = 15
        
        team1Img.layer.cornerRadius = 10
        team2Img.layer.cornerRadius = 10
        
        self.bgView.backgroundColor = .systemGray6
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func matchConfiguration(){
        
        matchDescription.text = (matches?.name)
        scoreLbl.text! = "\(String(matches?.score[0].r ?? 4))/\(String(matches?.score[0].w ?? 0)) \n (\(String(matches?.score[0].o ?? 0)))"
        team1Img.setImage(with: (matches?.teamInfo[0].img) ?? "haha")
        var i = matches?.score.count
        if (i ?? 0) > 1{
            scoreLbl2.text! = "\(String(matches?.score[1].r ?? 4))/\(String(matches?.score[1].w ?? 0)) \n (\(String(matches?.score[1].o ?? 0)))"
        }else{
            scoreLbl2.text = "Yet to bat"
        }
        team2Img.setImage(with: (matches?.teamInfo[1].img) ?? "hahaha")
            
        matchStatus.text = matches?.status
    }
    
}
