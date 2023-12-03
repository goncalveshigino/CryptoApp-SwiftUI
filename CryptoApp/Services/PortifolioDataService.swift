//
//  PortifolioDataService.swift
//  CryptoApp
//
//  Created by Goncalves Higino on 03/12/23.
//

import Foundation
import CoreData

class PortifolioDataService {
    
    private let container: NSPersistentContainer
    private let containerName: String = "PortifolioContainer"
    private let entityName: String = "PortifolioEntity"
    
    @Published var savedEntities: [PortifolioEntity] = []
    
    init() {
        container = NSPersistentContainer(name: containerName)
        container.loadPersistentStores { (_, error) in
            if let error = error {
                print("Error loading Core Data! \(error)")
            }
            self.getPortifolio()
        }
    }
    
    // MARK: PUBLIC
    
    func updatePortfolio(coin: CoinModel, amount: Double) {
        
        //check if coin is already in portfolio
        if let entity = savedEntities.first(where: { $0.coinID == coin.id }) {
            if amount > 0 {
                update(entity: entity, amount: amount)
            } else {
                delete(entity: entity)
            }
        } else {
            add(coin: coin, amount: amount)
        }
    }
    
    // MARK: PRIVATE
    
    private func getPortifolio() {
        let request = NSFetchRequest<PortifolioEntity>(entityName: entityName)
        do {
          savedEntities =  try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching Portifolio Entities. \(error)")
        }
    }
    
    private func add(coin: CoinModel, amount: Double) {
        let entity = PortifolioEntity(context: container.viewContext)
        entity.coinID = coin.id
        entity.amount = amount
        applyChanges()
    }
    
    
    private func update(entity: PortifolioEntity, amount: Double) {
        entity.amount = amount
        applyChanges()
    }
    
    private func delete(entity: PortifolioEntity) {
        container.viewContext.delete(entity)
        applyChanges()
    }
    
    private func save() {
        do {
            try container.viewContext.save()
        } catch let error {
            print("Error saving to Core Data. \(error)")
        }
    }
    
    private func applyChanges() {
        save()
        getPortifolio()
    }
    
}
