include("../../src/core.jl")

im = IndexMap{Int32, 2}(Dict(1=>2, 2=>4), 2)

@test typeof(im) == IndexMap{Int32, 2}
@test typeof(IndexMap(Dict(Int32(1)=>Int32(1)), Int32(1))) == IndexMap{Int32, 1}
@test typeof(IndexMap{Int8, 3}(Dict(1=>1), 1)) == IndexMap{Int8, 3}
@test typeof(IndexMap(Dict(1=>1), 1, 3)) == IndexMap{Int64, 3}

@test sort(collect(keys(reverse(im).map))) == [2, 4]
@test typeof(reverse(im)) == typeof(im)
@test dim(im) == 2
