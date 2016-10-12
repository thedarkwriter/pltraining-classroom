class classroom::course::virtual::appropriate_module (
  $session_id = $classroom::params::session_id,
  $role = $classroom::params::role,
) inherits classroom::params {
  if $role == 'master' {

    include classroom::master::showoff

    class { 'puppetfactory':
      plugins          => [ "Certificates", "Classification", "ConsoleUser", "Docker", "Logs", "ShellUser", "UserEnvironment" ],
      puppetcode       => $classroom::params::workdir,
      modulepath       => 'readwrite',
      usersuffix       => $classroom::params::usersuffix,
      session          => $session_id,
      privileged       => false,
    }

  }
}
