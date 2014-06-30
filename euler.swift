extension Range {
    func map(mutator: T -> T) -> T[] {
        var output = T[]()
        for element in self {
            output.append(mutator(element))
        }
        return output;
    }

    func filter(comparator: T -> Bool) -> T[] {
        var output = T[]()
        for element in self {
            if comparator(element) {
                output.append(element)
            }
        }
        return output
    }

    func reduce<U>(initial: U, reducer: (U,T)->U) -> U {
        var reduction = initial
        for element in self {
            reduction = reducer(reduction, element)
        }
        return reduction
    }
}
