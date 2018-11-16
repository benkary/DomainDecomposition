## IndexSet
"""
    IndexMap(map, n)

Stores an index map as a dictionary of size n for geometrical entities of dimension D.
Key value pairs store a permutation such that source indices (keys) may be mapped to 
destination indices (values)

Parameters:
T <: Integer : Type of index integers
D : Value Type : Dimension parameter indicating whether index set describes vertices,
edges, faces, or tetrahedra.

Fields:
map::Dict{T, T} : Mapping dictionary.
n::T : number of key/value pairs in the dictionary.

Examples:
im = IndexMap(Dict(1=>1, 2=>2), 2) : IndexMap{Int64, 1}
im = IndexMap{Int32, 2}(Dict(1=>1, 2=>2), 2) : IndexMap{Int32, 1}
im = IndexMap(Dict(1=>1, 2=>2), 2, 2) : IndexMap{Int64, 2}
"""
struct IndexMap{T<:Integer, D}
    map::Dict{T, T}
    n::T
    function IndexMap(map::Dict{T, T}, n::T, D) where {T<:Integer}
        if !(D in [1, 2, 3])
            error("Dimension parameter D must be either 1, 2, or 3")
        elseif n != length(keys(map))
            error("Size attribute n must match length of map")
        else
            new{T, D}(map, n)
        end
    end
end

function IndexMap(map::Dict{T, T}, n::T) where {T<:Integer}
    return IndexMap(map, n, 1)
end

function IndexMap{Tn, D}(map::Dict{T, T}, n::T) where {Tn<:Integer, T<:Integer, D}
    if Tn != T
        map = Dict(Tn(k)=>Tn(v) for (k, v) in map)
        n = Tn(n)
    end
    return IndexMap(map, n, D)
end

function reverse(im::IndexMap{T, D}) where {T<:Integer, D}
    return IndexMap{T, D}(Dict(v=>k for (k,v) in im.map), im.n)
end

dim(im::IndexMap{T, D}) where {T<:Integer, D} = D

