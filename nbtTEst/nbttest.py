import python_nbt.nbt as nbt

file=nbt.read_from_nbt_file("r.0.0.mca")

print(file["TileEntities"])