...
MPI::COMM_WORLD.Recv(
	&local_numbers[info[1]][info[2]][0],
	info[0],
	MPI::INT,
	status.Get_source(),
	TAG_SYNC_NODE_TYPES
...
MPI_NODE_TYPES[info[1]][info[2]] =  MPI_ELNODE.Create_indexed(
	info[0],
	&lengths[0],
	&local_numbers[info[1]][info[2]][0]
);
MPI_NODE_TYPES[info[1]][info[2]].Commit();

