function comm = get_brains_reward_manager(program, conf)

comm = brains.arduino.get_serial_comm();
comm.start();

end