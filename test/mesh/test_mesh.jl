include("../../src/mesh.jl")

mesh2d = readGmsh("Example2d.msh")

@test mesh2d.nv == 2210
@test mesh2d.ne ==
@test mesh2d.nt ==