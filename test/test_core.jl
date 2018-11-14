include("../src/core.jl")

@test typeof(IndexMap(Dict(1=>1), 1)) == IndexMap{Int64, 1}
@test typeof(IndexMap(Dict(Int32(1)=>Int32(1)), Int32(1))) == IndexMap{Int32, 1}
@test typeof(IndexMap{Int8, 3}(Dict(1=>1), 1)) == IndexMap{Int8, 3}
@test typeof(IndexMap(Dict(1=>1), 1, 3)) == IndexMap{Int64, 3}