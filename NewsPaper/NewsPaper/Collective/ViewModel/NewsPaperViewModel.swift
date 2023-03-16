//
//  NewsPaperViewModel.swift
//  NewsPaper
//
//  Created by serif mete on 16.03.2023.
//

import Foundation

protocol INewsPaperViewModel {
    
    //MARK: - My Variable
    var newsPaperTr: [Article] { get set }
    var newsPaperService: INewsPaperService { get }
    
    var newsPaperOutPut: NewsPaperViewOutPut? { get }
    
    //MARK: - My Func
    
    func setDelegate(output: NewsPaperViewOutPut)
    func fetchItems()
    func changeLoading()
}

final class NewsPaperViewModel: INewsPaperViewModel {
    //MARK: - My Variable
    var newsPaperOutPut: NewsPaperViewOutPut?
    var newsPaperTr: [Article] = []
    private var isLoading = false
    var newsPaperService: INewsPaperService
    
    //MARK: - İNİT
    init() {
        newsPaperService = NewsPaperService()
    }
    
    //MARK: - My Func
    
    func setDelegate(output: NewsPaperViewOutPut) {
        newsPaperOutPut = output
    }
    
    func fetchItems() {
        changeLoading()
        newsPaperService.fetchAllData { [weak self] (response) in
            self?.changeLoading()
            self?.newsPaperTr = response ?? []
            self?.newsPaperOutPut?.saveData(values: self?.newsPaperTr ?? [])
        }
    }
    
    func changeLoading() {
        isLoading = !isLoading
        newsPaperOutPut?.changeLoading(isLoad: isLoading)
    }
    
    
}
