package Rex::Ssh::Keys;
use Rex -base;
use Rex::Ext::ParamLookup;

user 'root';
key_auth;

# Usage: rex setup ( user => "root" home => "/root" sshkey => "ssh-rsa AAAAAAAAAAA ... user@place" )

desc 'Add in the ssh keys for my user';
task 'setup', sub { 

	my $user     = param_lookup "user";
	my $home     = param_lookup "home";
	my $sshkey   = param_lookup "sshkey";
	
	account "$user",
		home    => "$home";
		ssh_key => "$sshkey";

};

1;
