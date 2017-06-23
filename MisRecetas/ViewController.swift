//
//  ViewController.swift
//  MisRecetas
//
//  Created by Smart Geeks on 14/6/17.
//  Copyright © 2017 SmartGeeks. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var recipes : [Recipe] = []
    var recipe : Recipe!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        navigationController?.navigationBar.barTintColor = UIColor.white
        
        recipe = Recipe(name: "Torta De Fresas Españolas -  Mayorca",
                        image: #imageLiteral(resourceName: "strawberryCake"),
                        time: 38,
                        ingredients: ["Arina", "Cocoa", "Huevos", "Fresas frescas", "Gelatina sin sabor"],
                        steps: ["Tomar un recipientes","Agregar Arina","Agregar Huevos","Hornear","Hacer Salsa con fresas", "Decorar con Fresas"],
                        isFavorite: true)
        
        recipes.append(recipe)
        
        recipe = Recipe(name: "Torta De Chololate Suizo de Suiza",
                        image: #imageLiteral(resourceName: "chocolateCake"),
                        time: 30,
                        ingredients: ["Arina", "Cocoa", "Huevos", "Cobertura de chocolate"],
                        steps: ["Tomar un recipientes","Agregar Arina","Agregar Huevos","Hornear","Cubrir con chocolate"],
                        isFavorite: false)
        
        recipes.append(recipe)
        
        
        recipe = Recipe(name: "Torta De Arequipe Rellena de Chocolate",
                        image: #imageLiteral(resourceName: "cafeCake"),
                        time: 25,
                        ingredients: ["Arina", "Cocoa", "Huevos", "Arequipe", "Crema de leche"],
                        steps: ["Tomar un recipientes","Agregar Arina","Agregar Huevos","Hornear","Dividir en dos partes","Hacer salsa de arequipe", "Cubrir con arequipe", "Armar nuevamente"],
                        isFavorite: true)
        
        recipes.append(recipe)
        
        
        recipe = Recipe(name: "Postre primavera de frutos verdes",
                        image: #imageLiteral(resourceName: "postre"),
                        time: 45,
                        ingredients: ["Arina", "Cocoa", "Huevos", "Arequipe", "Crema de leche", "Flores", "Salsa de moca"],
                        steps: ["Tomar un recipientes","Agregar Arina","Agregar Huevos","Hornear","Dividir en dos partes","Hacer salsa de arequipe", "Cubrir con Flores"],
                        isFavorite: false)
        
        recipes.append(recipe)
        
        recipe = Recipe(name: "Torta Moca con Flores Silvestres",
                        image: #imageLiteral(resourceName: "flowerCake"),
                        time: 45,
                        ingredients: ["Arina", "Cocoa", "Huevos", "Arequipe", "Crema de leche", "Flores", "Salsa de moca"],
                        steps: ["Tomar un recipientes","Agregar Arina","Agregar Huevos","Hornear","Dividir en dos partes","Hacer salsa de arequipe", "Cubrir con Flores"],
                        isFavorite: true)
        
        recipes.append(recipe)
        

        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool { return true }
    

    //MARK: - UITableViewDataSource
    
    //Funcion para definir la cantidad de secciones de nuestra tabla
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //Funcion para definir la cantidad de filas que tendra nuestra tabla en la seccion -  tamaño de el Array
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.recipes.count
    }
    
    //Funcion para Seleccionar todas y cada una de las celdas que deben ser mostradas en pantalla
    //MARK: - indexPath es el identificador de la celda
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        /*  indexPath.row  -  Me indicara la fila*/
        /*  indexPath.section - Me indicara la seccion*/
        
        let recipe = recipes[indexPath.row]
        
        //Identificador de la celda
        let cellId = "RecipeCell"
        
        //Creamos las celdas tomando el identificador de esta
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! FullRecipeCell
        // MARK: El metodo dequeueReusableCell es para reciclar filas y no recargar la memoria - es decir solo se mostraran los campos que aparecen en pantalla
        
        cell.imageViewFullCell.image = recipe.image
        cell.nameLabelFullCell.text = recipe.name
        
        if recipe.isFavorite {
            cell.accessoryType = .checkmark
        }else{
            cell.accessoryType = .none
        }
        
        
        /* MARK: volver imagenes circulares por codigo:
        cell.imageViewCell.layer.cornerRadius = 42.0
        cell.imageViewCell.clipsToBounds =  true */
        
        
        return cell
        
    }
    
     /* // MARK: Metodo para agregar swipe en la celda
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            self.recipes.remove(at: indexPath.row)
            
        }
        
        //self.tableView.reloadData()
        self.tableView.deleteRows(at: [indexPath], with: .middle )
    } */
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        //Creamos la accion para compartir tipo UITableViewRowACtion
        let shareAction = UITableViewRowAction(style: .default, title: "Compartir") { (action, indexPath) in
            
            //Creamos la constante que tendra el texto a copartir
            let shareDefaultText = "Estoy mirando  la receta de \(self.recipes[indexPath.row].name!) En la App de recetas del curso de iOS 10 de Juan Gabriel"
            
            //Creamos la constante de la actividad tipo  UIActivityViewController para mostrar servicios de apple, copiar, cortar, publicar en redes
            let activityController = UIActivityViewController(activityItems: [self.recipes[indexPath.row].image, shareDefaultText], applicationActivities: nil)
            
            //Presentamos el UiActivityViewController
            self.present(activityController, animated: true, completion: nil)
            
            
        }
        
        //Cambiamos el color de el shareAction
        shareAction.backgroundColor = UIColor (red: 255.0/255.0, green: 208.0/255.0, blue: 0.0/255.0, alpha: 1.0)
        
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Borrar") { (action2, indexPath) in
            
            
            
            self.recipes.remove(at: indexPath.row)
            
            
            //self.tableView.reloadData()
            //Forma mucho mas util eficaz y recomendad de borrar solo la celda y no recargar la memoria de el celular
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            
            
        }
        
        deleteAction.backgroundColor = UIColor (red: 202.0/255.0, green: 202.0/255.0, blue: 202.0/255.0, alpha: 1.0)
        
        
        return [shareAction, deleteAction]
    }

    
    // MARK: UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let recipe = recipes[indexPath.row]
        
        let alertController = UIAlertController(title: recipe.name, message: "Has seleccionado la fila numero \(indexPath.row)\n Valora este plato", preferredStyle: .actionSheet )
        
        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        
        var titleButtonFavorite : String = "Favorito"
        var favoriteActionStyle = UIAlertActionStyle.default
        
        if recipe.isFavorite {
            
            titleButtonFavorite = "No Favorito"
            favoriteActionStyle = UIAlertActionStyle.destructive
        }
        
        let favoriteAction = UIAlertAction(title: titleButtonFavorite, style: favoriteActionStyle) { (actionFavorite) in
            
            let recipe = self.recipes[indexPath.row]
            
            //Esta sintaxis nos pasa la variable bool de el estado actual a su contratio... si esta false pasa a true y si esta true pasa a false
            recipe.isFavorite = !recipe.isFavorite
            self.tableView.reloadData()
        }
        alertController.addAction(favoriteAction)
        
        present(alertController, animated: true, completion: nil)
        
        print ("He seleccionado la fila numero \(indexPath.row)")
    }


}

