//
//  ViewController.swift
//  WeatherToday
//
//  Created by WG Yang on 2022/03/10.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    
    let cellIdentifier: String = "CountryListCell"
    
    var countries: [Country] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
      return self.countries.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //큐에서 셀 받아서
        let cell: CountryListTableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as! CountryListTableViewCell
        
        //국가 정보
        let country: Country = self.countries[indexPath.row]
        //국기
        
        cell.nameLabel?.text = country.korean_name
        cell.korean_name = country.korean_name
        cell.asset_name = country.asset_name
        
        if let flagImage: UIImage = UIImage(named: country.flagAssetName){
        cell.flagImageView.image = flagImage
        }
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //에셋에서 국가리스트 디코딩
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "countries") else {
            return
        }
        do {
            self.countries = try jsonDecoder.decode([Country].self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let nextViewController: CityListViewController = segue.destination as? CityListViewController else {
            return
        }
        
        guard let cell: CountryListTableViewCell = sender as? CountryListTableViewCell else {
            return
        }
        
        nextViewController.countryToSet = cell.asset_name
    }


}

