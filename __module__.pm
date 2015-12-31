package Rex::Ssh::Rootkeys;
use Rex -base;
use Rex::Ext::ParamLookup;

user 'root';
key_auth;

# Usage: rex setup 

desc 'Add in the ssh keys for my user';
task 'setup', sub { 

	my $user     = param_lookup "user";
	my $sshkey   = param_lookup "sshkey";
	
	account "$user",
		ssh_key => "$sshkey";

};

1;
