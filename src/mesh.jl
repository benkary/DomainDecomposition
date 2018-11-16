function getGmshStats(file::String)
    mstats = Dict{String, Any}()
    open(file) do f
        l = readline(f)
        if l[2:end] == "MeshFormat"
            l = readline(f)
            mstats["MeshFormat"] = l
            ln = 2
        else 
            error("Not a valid Gmsh file")
        end
        
        while !eof(f)
            l = readline(f)
            ln += 1
            if l[2:end] == "Entities" 
                mstats["Entities"] = Dict{String, Any}()
                mstats["Entities"]["istart"] =  ln
                l = split(readline(f))
                mstats["Entities"]["numPoints"] = Int64(l[1])
                mstats["Entities"]["numCurves"] = Int64(l[2])
                mstats["Entities"]["numSurfaces"] = Int64(l[3])
                mstats["Entities"]["numVolumes"] = Int64(l[4])
                ln += 1
            end
            if l[2:end] == "PartitionedEntities" 
                mstats["istart"] = ln
                l = split(readline(f))
                mstats["PartitionedEntities"]["numPartitions"] = Int64(l)
                l = split(readline(f))
                mstats["PartitionedEntities"]["numGhostEntities"] = Int64(l)
                
            end
            if l[2:end] == "Nodes" 
                mstats["istart"] = ln 
            end
            if l[2:end] == "Elements" 
                mstats["istart"] = ln  
            end
            if l[2:end] == "GhostElements" 
                mstats["istart"] = ln  
            end
        end
    end

    return mstats
end