for (int i = 0; i < zones_info.size(); i++)
	if (get_proc_for_zone(i) != proc_num)
		for (int j = 0; j < zones_info.size(); j++)
			if (local_numbers[i][j].size())
			{
				*logger << "Sending nodes from zone " << j << " to zone " < i;
				reqs.push_back(
					MPI::COMM_WORLD.Isend(
						&mesh_set->get_mesh_by_zone_num(j)->nodes[0],
						1,
						MPI_NODE_TYPES[i][j],
						get_proc_for_zone(i),
						TAG_SYNC_NODE+100*i+j
					)
				);
			}

