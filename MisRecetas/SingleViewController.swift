//
//  SingleViewController.swift
//  MisRecetas
//
//  Created by Smart Geeks on 14/6/17.
//  Copyright © 2017 SmartGeeks. All rights reserved.
//

import UIKit

class SingleViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    var recipes : [Recipe] = []
    var recipe : Recipe!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
          /* Para decirle a la tableView que depende del datasource y de su delagado con codigo se recomienda de manera grafica - es mas facil */
          /* self.tableView.dataSource = self
           self.tableView.delegate = self */
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        recipe = Recipe(name: "Torta De Chololate Suizo de Suiza",
                        image: #imageLiteral(resourceName: "chocolateCake"),
                        time: 30,
                        ingredients: ["Arina", "Cocoa", "Huevos", "Cobertura de chocolate"],
                        steps: ["Tomar un recipientes","Agregar Arina","Agregar Huevos","Hornear","Cubrir con chocolate"],
                        isFavorite: true)
        
        recipes.append(recipe)

        
        recipe = Recipe(name: "Torta De Arequipe Rellena de Chocolate",
                        image: #imageLiteral(resourceName: "cafeCake"),
                        time: 25,
                        ingredients: ["Arina", "Cocoa", "Huevos", "Arequipe", "Crema de leche"],
                        steps: ["Tomar un recipientes, limpiarlo y proceder a ponerlo sobre la mesa ubicada en la esquina","Agregar Arina","Agregar Huevos","Hornear","Dividir en dos partes","Hacer salsa de arequipe", "Cubrir con arequipe", "Armar nuevamente"],
                        isFavorite: false)
        
        recipes.append(recipe)
        
        
        recipe = Recipe(name: "Postre primavera de frutos verdes",
                        image: #imageLiteral(resourceName: "postre"),
                        time: 45,
                        ingredients: ["Arina", "Cocoa", "Huevos", "Arequipe", "Crema de leche", "Flores", "Salsa de moca"],
                        steps: ["Tomar un recipientes","Agregar Arina","Agregar Huevos","Hornear","Dividir en dos partes","Hacer salsa de arequipe", "Cubrir con Flores"],
                        isFavorite: true)
        
        recipes.append(recipe)
        
        recipe = Recipe(name: "Torta Moca con Flores Silvestres",
                        image: #imageLiteral(resourceName: "flowerCake"),
                        time: 45,
                        ingredients: ["Arina", "Cocoa", "Huevos", "Arequipe", "Crema de leche", "Flores", "Salsa de moca"],
                        steps: ["Tomar un recipientes","Agregar Arina","Agregar Huevos","Hornear","Dividir en dos partes","Hacer salsa de arequipe", "Cubrir con Flores"],
                        isFavorite: false)
        
        recipes.append(recipe)
        
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



    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: Para poner la status bar tint de color blanca sobre superficies oscuras
    /* override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }*/
    
    
    // MARK: Para Ocultar el status bar
   /* override var prefersStatusBarHidden: Bool {
        
        return true
    }*/
    
    /*override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
    }*/
    
    
}


// MARK: UITableViewDataSource

extension SingleViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //Funcion para definir la cantidad de filas que tendra nuestra tabla en la seccion -  tamaño de el Array
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.recipes.count
    }
    
    //Funcion para Seleccionar todas y cada una de las celdas que deben ser mostradas en pantalla
    //MARK: - indexPath es el identificador de la celda
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        /*  indexPath.row  -  Me indicara la fila*/
        /*  indexPath.section - Me indicara la seccion*/
        
        let recipe = recipes[indexPath.row]
        
        //Identificador de la celda
        let cellId = "RecipeCell"
        
        //Creamos las celdas tomando el identificador de esta
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! RecipeCellSingle
        // MARK: El metodo dequeueReusableCell es para reciclar filas y no recargar la memoria - es decir solo se mostraran los campos que aparecen en pantalla
        
        cell.imageViewCellSingle.image = recipe.image
        cell.nameSingleLabel.text = recipe.name
        cell.timeSingleLabel.text = "Tiempo: \(recipe.time!)"
        cell.ingredientsSingleLabel.text = "Ingredientes: \(recipe.ingredients.count)"
        
        return cell
        
    }

    /* //MARK: - Metodo para agregar funcion de swipe de borrar en las celdas
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            self.recipes.remove(at: indexPath.row)
            
        }
        
        //self.tableView.reloadData()
        //Forma mucho mas util eficaz y recomendad de borrar solo la celda y no recargar la memoria de el celular
        self.tableView.deleteRows(at: [indexPath], with: .fade)
    } */
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
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
        shareAction.backgroundColor = UIColor (red: 154.0/255.0, green: 224.0/255.0, blue: 63.0/255.0, alpha: 1.0)
        
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Borrar") { (action2, indexPath) in
            
            
                
                self.recipes.remove(at: indexPath.row)
        
            
            //self.tableView.reloadData()
            //Forma mucho mas util eficaz y recomendad de borrar solo la celda y no recargar la memoria de el celular
            self.tableView.deleteRows(at: [indexPath], with: .fade)

            
        }
        
        deleteAction.backgroundColor = UIColor (red: 217.0/255.0, green: 47.0/255.0, blue: 47.0/255.0, alpha: 1.0)

        
         return [shareAction, deleteAction]
    }
        
    
    
}


// MARK: UITableViewDelegate

extension SingleViewController : UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        // MARK: Metodo para mostrar alert
       /* let alertController = UIAlertController(title: "Alerta", message: "Has seleccionado la fila numero \(indexPath.row)", preferredStyle: .actionSheet )
        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
        
        print ("He seleccionado la fila numero \(indexPath.row)") */
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showRecipeDetail" {
            
            //Optional Binding para validar que se tomo un valor de la posicion de el arreglo
            if let indexPath = self.tableView.indexPathForSelectedRow {
                
                //Tomamos el valor de el arreglo enla posicion seleccionado
                let selectedRecipe = self.recipes[indexPath.row]
                
                //Tomamos el valor de el viewController al que vamos a ir
                let destinationViewController = segue.destination as! DetailViewController
                
                destinationViewController.recipe = selectedRecipe
                
            }
        }
    }

}

