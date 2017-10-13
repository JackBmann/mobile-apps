//
//  ViewController.swift
//  PhotoBrowser
//
//  Created by jbaumann on 10/12/17.
//  Copyright © 2017 jbaumann. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController {
    
    var photos: [Photo] = []
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        fetchData()
    }
    
    func fetchData() {
        let url = URL(string: "https://api.flickr.com/services/rest/?format=json&sort=random&method=flickr.photos.search&tags=daffodil&tag_mode=all&api_key=0e2b6aaf8a6901c264acb91f151a3350&nojsoncallback=1")!
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { (data, response, err) in
            let data = data!
            let json = try! JSONSerialization.jsonObject(with: data, options: [])
            //Will be a list of dictionaries where the first dictionary from the input looks like so: ["isfriend": 0, "farm": 3, "id": 33735075571, "server": 2857, "secret": 1cc6fd03bf, "owner": 94209416@N06, "title": Daffodil Field, "ispublic": 1, "isfamily": 0]
            var photoList: [[String: Any]] = []
            if let dictionary = json as? [String: Any] {
                //Unwrapping the nested dictionaries and storing the "photo" dictionary as photoList
                if let nestedDictionary = dictionary["photos"] as? [String: Any] {
                    //The first dictionary in the nested "photo" dictionary: {farm = 3; id = 33735075571; isfamily = 0; isfriend = 0; ispublic = 1; owner = "94209416@N06"; secret = 1cc6fd03bf; server = 2857;title = "Daffodil Field";}
                    photoList = nestedDictionary["photo"] as! [[String: Any]]!
                }
            }
            
            self.photos = photoList.map { Photo(dictionary: $0) }
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        task.resume()
    }
    
}

extension CollectionViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageBrowserCell", for: indexPath) as! ImageBrowserCell
        cell.photoTitleLabel.text = photos[indexPath.item].title
        ImageService.shared.imageForURL(url: photos[indexPath.item].imageURL) { (image) in
            cell.imageView.image = image
        }
        return cell
    }

}

extension CollectionViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let photoViewController = storyboard.instantiateViewController(withIdentifier: "photoViewController") as! PhotoViewController
        photoViewController.photo = photos[indexPath.item]
        present(photoViewController, animated: true, completion: nil)
    }

}

