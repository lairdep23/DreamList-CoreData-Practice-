//
//  ItemDetailsVC.swift
//  CoreDataPractice
//
//  Created by Evan on 3/22/17.
//  Copyright © 2017 Evan. All rights reserved.
//

import UIKit
import CoreData

class ItemDetailsVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBOutlet weak var titleField: CustomTextField!
    
    @IBOutlet weak var priceField: CustomTextField!
    
    @IBOutlet weak var descField: CustomTextField!
    
    @IBOutlet weak var imageSelected: UIImageView!
    
    
    var storesArray = [Store]()
    var itemToEdit: Item?
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self

        if let topItem = self.navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        }
        
        /*let store  = Store(context: context)
        store.name = "Amazon"
        
        let store1  = Store(context: context)
        store1.name = "Best Buy"
        
        let store2  = Store(context: context)
        store2.name = "Walmart"
        
        let store3  = Store(context: context)
        store3.name = "Target"
        
        let store4  = Store(context: context)
        store4.name = "Jet"
        
        ad.saveContext()*/
        
        getStores()
        
        if itemToEdit != nil {
            loadItemData()
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let store = storesArray[row]
        return store.name
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return storesArray.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
    }
    
    func getStores() {
        let fetchedRequest: NSFetchRequest<Store> = Store.fetchRequest()
        
        do {
            self.storesArray = try context.fetch(fetchedRequest)
            self.pickerView.reloadAllComponents()
        } catch {
            
        }
    }
    
    
    @IBAction func imageBtn(_ sender: Any) {
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageSelected.image = image
        }
        
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func saveItemBtn(_ sender: Any) {
        let picture = Image(context: context)
        var item: Item!
        
        if itemToEdit == nil {
            item = Item(context: context)
        } else {
            item = itemToEdit
        }
        
        if let title = titleField.text {
            item.title = title
        }
        
        if let price = priceField.text {
            item.price = (price as NSString).doubleValue
        }
        
        if let details = descField.text {
            item.details = details
        }
        
        if imageSelected.image != UIImage(named:"camera_icon_snap") {
            picture.image = imageSelected.image
            item.toImage = picture
        }
        
        item.toStore = storesArray[pickerView.selectedRow(inComponent: 0)]
        
        ad.saveContext()
        
        _ = navigationController?.popViewController(animated: true)
        
    }
    
    func loadItemData() {
        
        if let item = itemToEdit {
            titleField.text = item.title
            priceField.text = "\(item.price)"
            descField.text = item.details
            imageSelected.image = item.toImage?.image as? UIImage
            
            if let store = item.toStore {
                var index = 0
                repeat {
                    
                    let s = storesArray[index]
                    
                    if s.name == store.name {
                        pickerView.selectRow(index, inComponent: 0, animated: true)
                        break
                    }
                    
                    index += 1
                    
                } while (index < storesArray.count)
            }
        }
        
    }

    @IBAction func deleteBtn(_ sender: Any) {
        
        if itemToEdit != nil {
            context.delete(itemToEdit!)
            ad.saveContext()
        }
        
        _ = navigationController?.popViewController(animated: true)
        
        
    }
    

    

}
