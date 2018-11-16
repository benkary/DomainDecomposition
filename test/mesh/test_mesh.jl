include("../../src/mesh.jl")

# mesh2d = readGmsh("Example2d.msh")
mstat = getGmshStats(pwd() * "/mesh/Example2D_np4_g.msh")

@test mstat["MeshFormat"] == "4 0 8"
@test mstat["Entities"]["istart"] == 4
@test mstat["Entities"]["numPoints"] == 4
@test mstat["Entities"]["numCurves"] == 4
@test mstat["Entities"]["numSurfaces"] == 1
@test mstat["Entities"]["numVolumes"] == 0
@test mstat["PartitionedEntities"]["istart"] == 16
@test mstat["PartitionedEntities"]["numPartitions"] == 4
@test mstat["PartitionedEntities"]["numGhostEntities"] == 4

@test mstat["Nodes"]["istart"] == 52
@test mstat["Elements"]["istart"] == 637
@test mstat["GhostElements"]["istart"] == 1835


# @test mesh2d.nv == 
# @test mesh2d.ne ==
# @test mesh2d.nt ==