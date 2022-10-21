class Solution {
    func minCostConnectPoints(_ points: [[Int]]) -> Int {
            
        var totCost = 0
        var adjList = [Int : [ComparableTuple]]()
        for i in 0..<points.count{
            for j in i+1..<points.count{
                let cost = dist(points[i], points[j])
                
                adjList[i, default: []].append(ComparableTuple( cost,  j))
                adjList[j, default: []].append(ComparableTuple( cost,  i))
            }
        }
        
        var visted = Set<Int>()
        var minHeap: MinHeap<ComparableTuple> = MinHeap(items: [ComparableTuple(0, 0)])
        //PRIMs Algo
        while visted.count < points.count{
            let _myTuple = minHeap.poll()
            let cost = _myTuple.cost
            let pointsIndex = _myTuple.pointsIndex
            
            if visted.contains(pointsIndex){
                continue
            }
            
            totCost += cost
            visted.insert(pointsIndex)
                
            for i in 0..<(adjList[pointsIndex]?.count ?? 0){
                let neighbor = adjList[pointsIndex]?[i]
                if  !visted.contains(neighbor!.pointsIndex) {
                    minHeap.add(neighbor!)
                }
            }
        }
        
        return totCost
    }
    
    private func dist(_ p1: [Int], _ p2: [Int]) -> Int{
        return abs(p1[0] - p2[0]) + abs(p1[1] - p2[1])
    }
}

Solution().minCostConnectPoints([[3,12],[-2,5],[-4,1]])
