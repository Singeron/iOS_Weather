

import UIKit

//private let reuseIdentifier = "AboutCitiesCell" - эта константа не нужна

class CitiesViewController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier) - этот код тоже не нужен
        
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // получаем пул ячеек
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AboutCitiesCell", for: indexPath) as! CitiesCell
        // устанавливаем город в значение ячейки
        cell.name.text = "Рим"
        cell.group.text = "Любимые"
        
        return cell
    }
}
