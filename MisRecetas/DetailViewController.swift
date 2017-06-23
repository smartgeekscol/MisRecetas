//
//  DetailViewController.swift
//  MisRecetas
//
//  Created by Smart Geeks on 15/6/17.
//  Copyright © 2017 SmartGeeks. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet var ouletButtonLike: UIButton!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var detailImageView: UIImageView!
    
    var recipe : Recipe!
      
    override func viewDidLoad() {
        super.viewDidLoad()

     // MARK: CAmbiar titulo De El Navigation Controller
     //Poner Tirulo del sobre EL Navigation Controller con el Nombre
     //self.title = self.recipe.name
        self.title = "Pantalla Detalle"
        
     self.detailImageView.image = self.recipe.image
        
     // Dar color de fondo a la tabla
     //self.tableView.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        
    // Para eliminar las celdas vacias de abajo de la tabla
    self.tableView.tableFooterView = UIView(frame: .zero)
        
        // Dar color al separador por codigo
        //self.tableView.separatorColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        
        //MARK: Para definir El tamaño automatico de las celdas y que sea dinamico 
    self.tableView.estimatedRowHeight = 60.0
    self.tableView.rowHeight = UITableViewAutomaticDimension
        
        
       let scale =  CGAffineTransform(scaleX: 0.0, y: 0.0)
       let traslate  = CGAffineTransform(translationX: 0.0, y: 500.0)
        
       ouletButtonLike.transform = scale.concatenating(traslate)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
      /*  UIView.animate(withDuration: 0.3, delay: 0.0, options: [], animations: {
            
            self.ouletButtonLike.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            
        }, completion: nil) */
        
        UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.5, options: [], animations: {
             self.ouletButtonLike.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }, completion: nil)
    }
    
    
    @IBAction func actionButtonLike(_ sender: UIButton) {
        
        if  self.recipe.isFavorite {
            
            print("Es favortio")
            ouletButtonLike.setImage( #imageLiteral(resourceName: "dislike"), for: .normal)
            recipe.isFavorite = false
            tableView.reloadData()
            
        }else{
            
            print("No es favorito")
            ouletButtonLike.setImage( #imageLiteral(resourceName: "like"), for: .normal)
            recipe.isFavorite = true
            tableView.reloadData()

        }
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
   /* override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }*/
}


extension DetailViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            
            return 3
            
        case 1:
            
            return self.recipe.ingredients.count
            
        case 2:
            
            return self.recipe.steps.count
            
        default:
            return 0
        }
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //Creamos la celda
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath) as! RecipeDetailCell
        
     
        switch indexPath.section {
        case 0:
            
            switch indexPath.row {
                
            case 0:
                cell.keyLabel.text = "Nombre:"
                cell.valueLabel.text = self.recipe.name
            case 1:
                cell.keyLabel.text = "Tiempo:"
                cell.valueLabel.text = "\(self.recipe.time!) min"
            default:
                cell.keyLabel.text = "Favorito:"
                if self.recipe.isFavorite {
                    cell.valueLabel.text = "SI"
                    ouletButtonLike.setImage( #imageLiteral(resourceName: "like"), for: .normal)
                    
                }else{
                    
                    cell.valueLabel.text = "NO"
                     ouletButtonLike.setImage( #imageLiteral(resourceName: "dislike"), for: .normal)
                }
                break
            }
            
        case 1:
            
           /* if indexPath.row == 0 {
                
                cell.keyLabel.text = "Ingredientes:"
                
            }else {
                
                 cell.keyLabel.text = "\(indexPath.row) = "
            }
            
            
            if indexPath.row == 0 {
                
                cell.valueLabel.text = ""
                
                
            }*/

            
            //if indexPath.row == 1 {
            
            cell.keyLabel.text = "\(indexPath.row+1). "
            cell.valueLabel.text = self.recipe.ingredients[indexPath.row]

                
            //}

            
        case 2:
            
           /* if indexPath.row == 0 {
                
                cell.keyLabel.text = "Pasos:"
                
            }else {
                
                cell.keyLabel.text = "\(indexPath.row) ="
            }
            
            if indexPath.row == 0 {
                
                cell.valueLabel.text = ""
                
                
            }*/
            
            
           // if indexPath.row == 1 {
            
               cell.keyLabel.text = "\(indexPath.row+1). "
               cell.valueLabel.text = self.recipe.steps[indexPath.row]
                
                
            //}

            

            
        default:
            break
        }
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        var title = ""
        
        switch section {
        case 1:
            title = "Ingredientes"
        case 2:
            title = "Pasos"
        default:
            break
        }
        
        return title
    }
    

    
    
}

extension DetailViewController : UITableViewDelegate {
    
    // MARK: Metodo del Delgate para Personalizar el section Header
    func tableView(_ tableView: UITableView, willDisplayHeaderView view:UIView, forSection: Int) {
        
        if let headerTitle = view as? UITableViewHeaderFooterView {
            headerTitle.textLabel?.textColor = UIColor.black
            headerTitle.textLabel?.font = UIFont(name: "Avenir-Light", size: 15.0)
            headerTitle.textLabel?.textAlignment = NSTextAlignment.center
        }
    }
    
   
    
}
