##
# Repositories we want
##
zypprepo { "Packman Repository":
  enabled      => 1,
  autorefresh  => 1,
  baseurl      => 'http://ftp.gwdg.de/pub/linux/packman/suse/openSUSE_13.1/',
  type         => 'rpm-md',
  gpgcheck     => 0,
  keeppackages => 0,
  before       => Package['basePackages'],  
}

zypprepo { "namtrac:subpixel":
  enabled      => 1,
  autorefresh  => 1,
  baseurl      => "http://download.opensuse.org/repositories/home:/namtrac:/subpixel/openSUSE_13.1/",
  type         => 'rpm-md',
  gpgcheck     => 0,
  keeppackages => 0,
  before       => Package['basePackages'],
}

zypprepo { "VirtualBox":
  enabled      => 1,
  autorefresh  => 1,
  baseurl      => "http://download.virtualbox.org/virtualbox/rpm/opensuse/12.3",
  type         => 'yum',
  keeppackages => 0,
  gpgcheck     => 0,
  priority     => 120,
  before       => Package['basePackages'],
}

exec { 'upgrade-to-repos':
  command      => '/usr/bin/zypper --non-interactive dup -l --recommends',
  user         => 'root',
  before       => Package['basePackages'],
}


##
# Some basic packages, just to make sure
##
$basePkgs = [
             'gcc',
             'make',
             'kernel-devel',
             ]

package { 'basePackages': 
  name => $basePkgs,
  ensure => 'installed',
  require => Exec['upgrade-to-repos'],
}


##
# Editors
##
$editorsPkgs = [
                'emacs',
                'emacs-nox',
                'emacs-el',
                'emacs-info',
                ]

package { 'editorsPkgs': 
  name => $editorsPkgs,
  ensure => 'installed',
  require => Package['basePackages'], 
}


##
# Everything for terminal work
##
$terminal_toolbox = [
                     'terminator',
                     'mc',
                     'htop',
                     'iftop',
                     'pv',
                     'pwgen',
                     'pixz',
                     'pbzip2',                     
                     ]

package { 'terminalPkgs': 
  name => $terminal_toolbox,
  ensure => 'installed',
  require => Package['basePackages'],
}


##
# VMs and other environment handling
##
$vmPkgs = [
           'VirtualBox-4.3',
           'lxc',
           'bridge-utils',
           'iputils',
           'screen',
           ]
package { 'vmPkgs':
  name => $vmPkgs,
  ensure => 'installed',
  require => Package['basePackages'],
  before => User['aphilipsenburg'],
}


##
# Some eye candy
##
$looknfeel = [
              'adobe-sourcecodepro-fonts',
              'adobe-sourcesanspro-fonts',
              'faenza-icon-theme',
              'faenza-icon-theme-dark',
              'faenza-icon-theme-darker',
              'faenza-icon-theme-darkest',
              'fontconfig-infinality',             
              ]
package { 'lnfPkgs': 
  name => $looknfeel,
  ensure => 'installed',
  require => Package['basePackages'],
}


##
# Dev tools
##
$devtools = [
             'git',
             'gitg',
             'mercurial',
             'subversion',
             'kdiff3',
             ]
package { 'devToolsPkgs': 
  name => $devtools,
  ensure => 'installed',
  require => Package['basePackages'],
}


##
# Programming environments
##
$devenvs = [
            'python',
            'python-virtualenvwrapper',
            ]
package { 'devEnvPkgs':
  name => $devenvs,
  ensure => 'installed',
  require => Package['basePackages'],
}


##
# Communications
##
$comPkgs = [
            'MozillaThunderbird',
            'enigmail',
            'pidgin',
            'pidgin-otr',
            'pidgin-plugin-pack',
            'pidgin-plugin-pack-extras',        
            ]

package { 'comPkgs':
  name => $comPkgs,
  ensure => 'installed',
  require => Package['basePackages'],
}


##
# Make sure we are members of the important groups
##
user { "aphilipsenburg":
  ensure     => 'present',
  forcelocal => true,
  groups     => [
                 'disk',
                 'vboxusers',
                 'users',
                 'video',
                 'audio',
                 'cdrom',
                 'lp',
                 'trusted',
                 ],
}
