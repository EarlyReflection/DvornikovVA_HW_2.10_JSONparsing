//
//  MainViewController.swift
//  DvornikovVA_HW_2.10_JSONparsing
//
//  Created by Vladimir Dvornikov on 21.10.2022.
//

import UIKit

private let reuseIdentifier = "Cell"

// enum подписан под CaseIterable можно было вернуть все эллеметы перечисления в виде массива
enum UserAction: String, CaseIterable {
    case downloadImage = "Download Image"
    case exampleOne = "Example One"
    case exampleTwo = "Example Two"
    case exampleThree = "Example Three"
    case exampleFour = "Example Four"
    case ourCourses = "Our Courses"
}

class MainViewController: UICollectionViewController {
    
    // метод allCases возвращает все эллеметы перечисления в виде массива
    let userActions = UserAction.allCases

    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        userActions.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! UserCell
    
        cell.actionLabel.text = userActions[indexPath.item].rawValue
        
        return cell
    }
}

//В расширении настройка размеров ячейки, для этого подписываемся под UICollectionViewDelegateFlowLayout.
//Тут ширина зависит от ширины экрана - UIScreen.main.bounds.width

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 48, height: 100)
    }
}