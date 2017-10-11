//
//  RecipeViewController.swift
//  RecipeReader
//
//  Created by jbaumann on 10/3/17.
//  Copyright © 2017 jbaumann. All rights reserved.
//

import UIKit

class RecipeViewController: UIViewController {
    
    var recipe: Recipe?
    
    @IBOutlet weak var recipeName: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        recipeName.text = recipe?.name
    }
    
}

extension RecipeViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return recipe?.ingredients.count ?? 0
        case 1:
            return recipe?.steps.count ?? 0
        case 2:
            return 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell  = tableView.dequeueReusableCell(withIdentifier: "IngredientCell", for: indexPath) as! IngredientCell
            cell.nameLabel.text = recipe?.ingredients[indexPath.item].name
            cell.quantityLabel.text = recipe?.ingredients[indexPath.item].quantity
            return cell
        case 1:
            let cell  = tableView.dequeueReusableCell(withIdentifier: "StepCell", for: indexPath) as! StepCell
            return cell
        case 2: fallthrough
        default:
            let cell  = tableView.dequeueReusableCell(withIdentifier: "SourceCell", for: indexPath) as! SourceCell
            return cell

        }
    }
    
}
