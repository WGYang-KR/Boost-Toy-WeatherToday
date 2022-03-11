//
//  DetailViewController.swift
//  WeatherToday
//
//  Created by WG Yang on 2022/03/10.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var stateImageView: UIImageView!
    @IBOutlet var stateLabel: UILabel!
    @IBOutlet var temperatureLabel: UILabel!
    @IBOutlet var rainPercentageLabel: UILabel!
    
    //이전 뷰에서 city 정보 넘겨받을 변수
    var city: City?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print(city)
        self.navigationItem.title = self.city?.city_name
        self.stateLabel.text = self.city?.stringState
        self.stateImageView.image = self.city?.iconState
        self.temperatureLabel.text = self.city?.stringTemperature
        self.rainPercentageLabel.text = self.city?.stringRainfallProbability
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
    }
 
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
