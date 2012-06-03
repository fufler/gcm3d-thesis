float DataBus::get_max_possible_tau(float local_time_step)
{
	MPI::COMM_WORLD.Barrier();
	
	float max_tau;     
	MPI::COMM_WORLD.Allreduce(&local_time_step, &max_tau, 1, MPI::FLOAT, MPI::MIN);
	*logger << "Time step synchronized, value is: " < max_tau; 

	return max_tau;
}
