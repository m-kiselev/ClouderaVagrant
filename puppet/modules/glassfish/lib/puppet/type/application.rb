Puppet::Type.newtype(:application) do
  @doc = "Manage applications of Glassfish domains"
  ensurable

  newparam(:name) do
    desc "The application name."
    isnamevar
  end

  newparam(:contextroot) do
    desc "The URL context root."
    defaultto ""
  end

  newparam(:source) do
    desc "The WAR file."
  end

  newparam(:adminport) do
    desc "The Glassfish domain port base. Default: 4848"
    defaultto "4848"
  end

  newparam(:domaindir) do
    desc "Specify domaindir to manage domains and resources in a different folder than under glassfish/domains/."    
  end

  newparam(:asadminuser) do
    desc "The internal Glassfish user asadmin uses. Default: admin"
    defaultto "admin"
  end

  newparam(:passwordfile) do
    desc "The file containing the password for the user."

    validate do |value|
      unless File.exists? value
        raise ArgumentError, "%s does not exists" % value
      end
    end
  end

  newparam(:user) do
    desc "The user to run the command as."

    validate do |user|
      unless Puppet.features.root?
        self.fail "Only root can execute commands as other users"
      end
    end
  end
end
