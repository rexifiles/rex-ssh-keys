package Rex::Ssh::Keys;
use Rex -base;

user 'root';
key_auth;

# Usage: rex install - This is for root keys only while I wait for multiple options for ssh keys from rex

desc 'Add in the ssh keys for root';
task 'setup', sub { 

	my $user   = param_lookup "user", "root";   # Ignored
	my $sshkey = param_lookup "sshkey";        # Required
	my $home   = param_lookup "home", "/root/"; # Optional
	
	my $authorized_keys_file = "$home/.ssh/authorized_keys";

	file "$authorized_keys_file",
	ensure => "directory",
	owner  => "$user",
	group  => "$user";

	append_if_no_such_line "$authorized_keys_file", "$sshkey", 
		on_change => sub { echo "Added ssh key"; };

};

1;
