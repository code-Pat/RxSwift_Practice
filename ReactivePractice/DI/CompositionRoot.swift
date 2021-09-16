//
//  CompositionRoot.swift
//  ReactivePractice
//
//  Created by Donggeun Lee on 2021/09/15.
//

struct AppDependency {
    let mainCoordinator: MainCoordinator
}

extension AppDependency {
    static func resolve() -> AppDependency {
        
        let stockRepository: StockRepository = StockRepositoryImpl()
        
        let stockListControllerFactory: () -> StockListController = {
            let usecase = StockUseCase(stockRepository: stockRepository)
            let viewModel = StockListViewModel(usecase: usecase)
            
            return .init(dependency: .init(viewModel: viewModel))
        }
        
        let stockDetailControllerFactory: (Stock) -> StockDetailController = { stock in
            return .init(dependency: .init(stock: stock))
        }
        
        let mainCoordinator: MainCoordinator = .init(dependency: .init(stockListControllerFactory: stockListControllerFactory, stockDetailControllerFactory: stockDetailControllerFactory))
        
        return .init(mainCoordinator: mainCoordinator)
    }
}
