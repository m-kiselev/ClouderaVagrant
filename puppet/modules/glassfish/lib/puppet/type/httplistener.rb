Puppet::Type.newtype(:httplistener) do
  @doc = "Manage http listener"

  ensurable

  newparam(:name) do
    desc "The listener id."
    isnamevar
  end

  newparam(:adminport) do
    desc "The Glassfish domain admin port."
    defaultto "4848"
  end

  newparam(:asadminuser) do
    desc "The internal Glassfish user asadmin uses. Default: admin"
    defaultto "admin"
  end

  newparam(:passwordfile) do
    desc "The file containing the password for the user."
  end

  newparam(:user) do
    desc "The user to run the command as."

    validate do |user|
      unless Puppet.features.root?
        self.fail "Only root can execute commands as other users"
      end
    end
  end

  newparam(:virtual_server) do
    desc "The glassfish virtual server."
    defaultto "server"
  end

  newparam(:listener_address) do
    desc "The glassfish server address. For example, test2-glassfish.kyc.megafon.ru"	
  end

  newparam(:listener_port) do
    desc "Listener port"
  end

end
