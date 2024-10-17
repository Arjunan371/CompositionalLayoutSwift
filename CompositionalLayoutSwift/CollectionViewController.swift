//
//  CollectionViewController.swift
//  CompositionalLayoutSwift
//
//  Created by Arjunan on 09/04/24.
//

import UIKit

class CollectionViewController: UIViewController {
    
    @IBOutlet weak var collectionViewFlow: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
    //    navigationItem.title = "Food Delivery"
        self.navigationController?.navigationBar.topItem?.title = "Home"
        collectionViewFlow.register(UINib(nibName: "CompositionalLayoutCell1", bundle: nil),forCellWithReuseIdentifier: "CompositionalLayoutCell1")
        collectionViewFlow.register(UINib(nibName: "CompositionalLayoutCell2", bundle: nil),forCellWithReuseIdentifier: "CompositionalLayoutCell2")
        collectionViewFlow.register(UINib(nibName: "CompositionalLayoutCell3", bundle: nil),forCellWithReuseIdentifier: "CompositionalLayoutCell3")
        collectionViewFlow.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.headerIdentifier)
        collectionViewFlow.register(FooterCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: FooterCollectionReusableView.footerIdentifier)
        collectionViewFlow.delegate = self
        collectionViewFlow.dataSource = self
        collectionViewFlow.collectionViewLayout = createCollectionViewLayout()
    }
}

extension CollectionViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //        return section == 1 ? 1 : 10
        if section == 0 {
            return 5
        }
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CompositionalLayoutCell1", for: indexPath) as! CompositionalLayoutCell1
            cell.backgroundColor = .clear
            cell.image1.image = UIImage(named: "image1")
            cell.layer.cornerRadius = 8
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CompositionalLayoutCell2", for: indexPath) as! CompositionalLayoutCell2
            cell.backgroundColor = .clear
            cell.label1.text = "vjcvnm,f kmv, fkjmnv m,c ,kmxv f,mnv"
            cell.layer.cornerRadius = 8
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CompositionalLayoutCell3", for: indexPath) as! CompositionalLayoutCell3
            cell.backgroundColor = .clear
            cell.layer.cornerRadius = 8
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let header = collectionViewFlow.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCollectionReusableView.headerIdentifier, for: indexPath) as! HeaderCollectionReusableView
            header.configure(index: indexPath)
            return header
        } else if kind == UICollectionView.elementKindSectionFooter {
            let footer = collectionViewFlow.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: FooterCollectionReusableView.footerIdentifier, for: indexPath) as! FooterCollectionReusableView
            footer.configure(index: indexPath)
            return footer
        }
        fatalError("Unexpected kind of supplementary view")
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.size.width, height: 50)
    }
}

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    //  private func createCollectionViewLayout() -> UICollectionViewCompositionalLayout {
    //    return UICollectionViewCompositionalLayout { (section, _) -> NSCollectionLayoutSection? in
    //      if section == 0 {
    //        // item
    //        let item = NSCollectionLayoutItem(
    //          layoutSize: NSCollectionLayoutSize(
    //            widthDimension: .fractionalWidth(1/5),
    //            heightDimension: .fractionalHeight(1)
    //          )
    //        )
    //        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 8)
    //
    //        // group
    //        let group = NSCollectionLayoutGroup.horizontal(
    //          layoutSize: NSCollectionLayoutSize(
    //            widthDimension: .fractionalWidth(1),
    //            heightDimension: .absolute(140)
    //          ),
    //          subitem: item,
    //          count: 5
    //        )
    //        group.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0)
    //
    //        // section
    //        let section = NSCollectionLayoutSection(group: group)
    //        section.orthogonalScrollingBehavior = .continuous
    //        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)
    //
    //        // return
    //        return section
    //
    //      } else if section == 1 {
    //          // item
    //          let item = NSCollectionLayoutItem(
    //            layoutSize: NSCollectionLayoutSize(
    //              widthDimension: .fractionalWidth(1),
    //              heightDimension: .fractionalHeight(1)
    //            )
    //          )
    //
    //          // group
    //          let group = NSCollectionLayoutGroup.horizontal(
    //            layoutSize: NSCollectionLayoutSize(
    //              widthDimension: .fractionalWidth(1),
    //              heightDimension: .absolute(85)
    //            ),
    //            subitem: item,
    //            count: 1
    //          )
    //          group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
    //
    //          // section
    //          let section = NSCollectionLayoutSection(group: group)
    //          section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)
    //
    //          // return
    //          return section
    //
    //        } else if section == 2 {
    //            // item
    //            let item = NSCollectionLayoutItem(
    //              layoutSize: NSCollectionLayoutSize(
    //                widthDimension: .fractionalWidth(1),
    //                heightDimension: .absolute(92)
    //              )
    //            )
    //            item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0)
    //
    //            // group
    //            let group = NSCollectionLayoutGroup.vertical(
    //              layoutSize: NSCollectionLayoutSize(
    //                widthDimension: .fractionalWidth(1),
    //                heightDimension: .absolute(92)
    //              ),
    //              subitem: item,
    //              count: 1
    //            )
    //            group.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0)
    //
    //            // section
    //            let section = NSCollectionLayoutSection(group: group)
    //            section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)
    //
    //            // return
    //            return section
    //          }
    //      return nil
    //    }
    //  }
    func createCollectionViewLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { sectionNumber,environMent in
            if sectionNumber == 0 {
                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                item.contentInsets = .init(top: 0, leading: 0, bottom: 16, trailing: 16)
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(250)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets.top = 16
                section.orthogonalScrollingBehavior = .paging
                // MARK: Header and Footer
                let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(50.0))
                let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
                let footer = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionFooter, alignment: .top)
                section.boundarySupplementaryItems = [header,footer]
                return section
            } else if sectionNumber == 1 {
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.25), heightDimension: .absolute(200)))
                item.contentInsets.trailing = 16
                item.contentInsets.bottom = 16
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(100)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets.leading = 16
                // MARK: Header and Footer
                let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(50.0))
                let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
                let footer = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionFooter, alignment: .top)
                section.boundarySupplementaryItems = [header, footer]
                return section
            } else if sectionNumber == 2 {
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                item.contentInsets.trailing = 16
                item.contentInsets.bottom = 16
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.8), heightDimension: .absolute(200)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets.leading = 16
                section.orthogonalScrollingBehavior = .paging
                // MARK: Header and Footer
                let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(50.0))
                let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
                let footer = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionFooter, alignment: .top)
                section.boundarySupplementaryItems = [header,footer]
                return section
            }
            return nil
        }
    }
    
}

