//
//  CityListViewController.swift
//  WeatherToday
//
//  Created by WG Yang on 2022/03/10.
//

import UIKit

class CityListViewController: UIViewController,UITableViewDataSource {

    //호출 뷰에서 넘겨준 값
    var korean_nameToSet: String?
    var asset_nameToSet: String?
    
    @IBOutlet var tableView: UITableView!
    let cellIdentifier: String = "CityListCell"
    var cities: [City] = []

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CityListTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CityListTableViewCell
        let city: City = self.cities[indexPath.row]
        
        cell.nameLabel?.text = city.city_name
        cell.temperatureLabel?.text = city.stringTemperature
        cell.rainfallPercentageLabel?.text = city.stringRainfallProbability
        cell.iconImageView.image = city.iconState
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
 }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        let jsonDecoder: JSONDecoder = JSONDecoder()
       
        guard let asset_name: String = self.asset_nameToSet else {
            print("국가명이 안넘어옴")
            return
        }
        
        guard let dataAsset: NSDataAsset = NSDataAsset(name: asset_name) else {
            return
        }
        do {
            self.cities = try jsonDecoder.decode([City].self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
        
        
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
