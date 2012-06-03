void DataBus::sync_outlines()
{
	MPI::COMM_WORLD.Barrier();
	// calculate displacements
	int *displ = (int*)malloc(sizeof(int)*procs_total_num);
	displ[0] = 0;
	for (int i = 1; i < procs_total_num; i++)
		displ[i] = displ[i-1]+ mesh_set->meshes_at_proc[i-1];
	*logger < "Syncing outlines";
	MPI::COMM_WORLD.Allgatherv(
		mesh_set->get_local_mesh(0),
		mesh_set->meshes_at_proc[proc_num],
		MPI_MESH_OUTLINE, mesh_set->get_mesh(0),
		mesh_set->meshes_at_proc,
		displ,
		MPI_MESH_OUTLINE
	);
	*logger < "Outlines synced";
	free(displ);
}
