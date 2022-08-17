//
//  MemoStore.swift
//  SwiftUIMemo
//
//  Created by 신도형 on 2022/08/18.
//

import Foundation

class MemoStore: ObservableObject {
    @Published var list: [Memo]
    
    init() {
        list = [
            Memo(content: "Hello", insertDate: Date.now),
            Memo(content: "예시 파일1", insertDate: Date.now.addingTimeInterval(3600 * -24)),
            Memo(content: "예시 파일2", insertDate: Date.now.addingTimeInterval(3600 * -24)),
        ]
    }
    
    func insert(memo: String) {
        list.insert(Memo(content: memo), at: 0)
    }
    
    func update(memo: Memo?, content: String) {
        guard let memo = memo else {
            return
        }

        memo.content = content
    }
    
    func delete(memo: Memo) {
        list.removeAll{ $0.id == memo.id }
    }
    
    func delete(set: IndexSet) {
        for index in set {
            list.remove(at: index)
        }
    }
}
