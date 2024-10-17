//
//  ViewController.swift
//  CompositionalLayoutSwift
//
//  Created by Arjunan on 09/04/24.
//

import UIKit

class ViewController: UIViewController {
    let imageNamesArray = ["pencil","eraser","trash","folder","paperplane","archivebox","doc","clipboard","note","calendar","book","book.circle","magazine","graduationcap","doc"]
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension UIColor {
    static var random: UIColor {
        return UIColor(red: .random(in: 0.4...1),
                       green: .random(in: 0.4...1),
                       blue: .random(in: 0.4...1),
                       alpha: 1)
    }
}


//MARK: -Extension 1 - Collection View Delegate and Data Source
extension ViewController: UICollectionViewDelegate ,UICollectionViewDataSource{
 
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageNamesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CompositionalLayoutCollectionViewCell", for: indexPath) as! CompositionalLayoutCollectionViewCell
        cell.imageView.image = UIImage(systemName: imageNamesArray[indexPath.row])
        cell.contentView.backgroundColor = .green
        return cell
    }
}

//MARK: - Extension 2 - UICollectionViewDelegateFlowLayout


extension ViewController:UICollectionViewDelegateFlowLayout{
    // Method 1
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 30, left: 10, bottom: 30, right: 10)
    }
    // Method 2
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 5
    }
    // Method 3
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 10
    }
    //Method 4
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let collectionViewWidth = collectionView.frame.width
        let collectionViewHeight =  collectionView.frame.height
        
        let cellWidth = (collectionViewWidth - 30) / 3
        let cellHeight = cellWidth * 0.5
        
        return CGSize(width: cellWidth , height: cellHeight)
        
    }
}
