//
//  ViewController.swift
//  BGTestTask
//
//  Created by Alexey Hvesko on 09.05.2021.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var devInfo: [(key: String, value: ViewController.Users)] = []
    var sortedDevInfo: ()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        fetchData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return devInfo.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as! CustomCell
        let imageURL = "http://dev.bgsoft.biz/task/" + devInfo[indexPath.row].key + ".jpg"
        let url = URL(string: imageURL)

        cell.imageView.downloadImage(url: url!)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height);
    }

}

extension ViewController {
    
    //MARK: - Parse JSON
    func fetchData() {
        if let url = URL(string: "http://dev.bgsoft.biz/task/credits.json") {
           URLSession.shared.dataTask(with: url) { data, response, error in
        if let data = data {
        let jsonDecoder = JSONDecoder()
        do {
        let parsedJSON = try jsonDecoder.decode([String: Users].self, from: data)
            for user in parsedJSON {
                self.devInfo.append(user)
                    }
                } catch {
        print(error)
                }
               }
           }.resume()
        }
    }
    
    struct Users: Codable {
        var userName: String
        var userUrl: String
        var photoUrl: String
        var colors: [String]
        
        enum CodingKeys: String, CodingKey {
                case userName = "user_name"
                case userUrl = "user_url"
                case photoUrl = "photo_url"
                case colors = "colors"
            }
    }
    
}

