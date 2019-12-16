# SSH-tunneling-internal


Server script to be run on a remote target that you have root access to. This will be the pivoting system that we can route our traffic to.


client script to run on local machine that will create an ssh tunnel in the background. The scirpt will also ask the user for a target IP or target CIDR range to route traffic through the virtual ethernet adapter.

